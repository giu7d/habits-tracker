defmodule HabitsTracker.Users.Auth do
  alias HabitsTracker.Provider.OAuth

  def execute(%{code: code}) do
    a = OAuth.GitHub.get_token!(code: code)
    IO.inspect(a)
    validate(a)
  end

  defp validate(%OAuth2.Client{
         token: %OAuth2.AccessToken{
           access_token: token,
           token_type: token_type,
           expires_at: expires_at
         }
       })
       when token != nil do
    {:ok, %{token: token, token_type: token_type, expires_at: expires_at}}
  end

  defp validate(_client) do
    {:error, %{token: "token is not defined."}}
  end
end
