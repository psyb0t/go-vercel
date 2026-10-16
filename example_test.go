package vercel_test

import (
	"context"
	"net/http"
	"os"

	vercel "github.com/psyb0t/go-vercel"
)

// Example is the README usage example. It calls the live API, so it is only
// compiled, never run.
//
//nolint:testableexamples // needs a real token and network access
func Example() {
	auth := vercel.WithRequestEditorFn(
		func(_ context.Context, req *http.Request) error {
			req.Header.Set("Authorization", "Bearer "+os.Getenv("VERCEL_TOKEN"))

			// Requests act on your personal account unless they name a team.
			if teamID := os.Getenv("VERCEL_TEAM_ID"); teamID != "" {
				query := req.URL.Query()
				query.Set("teamId", teamID)
				req.URL.RawQuery = query.Encode()
			}

			return nil
		},
	)

	client, err := vercel.NewClientWithResponses("https://api.vercel.com", auth)
	if err != nil {
		panic(err)
	}

	res, err := client.GetProjectsWithResponse(
		context.Background(),
		&vercel.GetProjectsParams{},
	)
	if err != nil {
		panic(err)
	}

	_ = res.JSON200
}
