package vercel_test

import (
	"context"
	"net/http"
	"net/http/httptest"
	"testing"

	vercel "github.com/psyb0t/go-vercel"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

const (
	testToken  = "test-token"
	testTeamID = "team_test"
)

type recordedRequest struct {
	method string
	path   string
	query  map[string]string
	auth   string
}

// newServer answers every request with body and records the last request.
func newServer(
	t *testing.T,
	body string,
) (*httptest.Server, *recordedRequest) {
	t.Helper()

	rec := &recordedRequest{}

	srv := httptest.NewServer(http.HandlerFunc(
		func(w http.ResponseWriter, r *http.Request) {
			rec.method = r.Method
			rec.path = r.URL.Path
			rec.auth = r.Header.Get("Authorization")
			rec.query = map[string]string{}

			for key := range r.URL.Query() {
				rec.query[key] = r.URL.Query().Get(key)
			}

			w.Header().Set("Content-Type", "application/json")
			_, _ = w.Write([]byte(body))
		},
	))
	t.Cleanup(srv.Close)

	return srv, rec
}

func newClient(
	t *testing.T,
	serverURL string,
) *vercel.ClientWithResponses {
	t.Helper()

	auth := vercel.WithRequestEditorFn(
		func(_ context.Context, req *http.Request) error {
			req.Header.Set("Authorization", "Bearer "+testToken)

			return nil
		},
	)

	client, err := vercel.NewClientWithResponses(serverURL, auth)
	require.NoError(t, err)

	return client
}

func TestGetAuthUser(t *testing.T) {
	t.Parallel()

	srv, rec := newServer(t, `{"user":{
		"id":"user_1","email":"me@example.com","username":"me",
		"limited":false
	}}`)
	client := newClient(t, srv.URL)

	res, err := client.GetAuthUserWithResponse(context.Background())
	require.NoError(t, err)

	assert.Equal(t, http.MethodGet, rec.method)
	assert.Equal(t, "/v2/user", rec.path)
	assert.Equal(t, "Bearer "+testToken, rec.auth)

	require.Equal(t, http.StatusOK, res.StatusCode())
	require.NotNil(t, res.JSON200)

	user, err := res.JSON200.User.AsAuthUser()
	require.NoError(t, err)

	assert.Equal(t, "user_1", user.Id)
	assert.Equal(t, "me@example.com", user.Email)
	assert.Equal(t, "me", user.Username)
}

func TestGetProjectsSendsTeamID(t *testing.T) {
	t.Parallel()

	srv, rec := newServer(t, `{
		"projects":[{"id":"prj_1","name":"site"}],
		"pagination":{"count":1,"next":null,"prev":null}
	}`)
	client := newClient(t, srv.URL)

	teamID := testTeamID
	search := "site"

	res, err := client.GetProjectsWithResponse(
		context.Background(),
		&vercel.GetProjectsParams{TeamId: &teamID, Search: &search},
	)
	require.NoError(t, err)

	assert.Equal(t, http.MethodGet, rec.method)
	assert.Equal(t, "/v10/projects", rec.path)
	assert.Equal(t, "Bearer "+testToken, rec.auth)
	assert.Equal(t, testTeamID, rec.query["teamId"])
	assert.Equal(t, "site", rec.query["search"])

	require.Equal(t, http.StatusOK, res.StatusCode())
	require.NotNil(t, res.JSON200)

	page, err := res.JSON200.AsGetProjects200JSONResponseBody1()
	require.NoError(t, err)
	require.Len(t, page.Projects, 1)

	assert.Equal(t, "prj_1", page.Projects[0].Id)
	assert.Equal(t, "site", page.Projects[0].Name)
}
