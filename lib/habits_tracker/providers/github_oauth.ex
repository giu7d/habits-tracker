defmodule HabitsTracker.Provider.OAuth.GitHub do
  use OAuth2.Strategy

  alias OAuth2.Client

  defp config do
    [
      strategy: __MODULE__,
      client_id: System.get_env("GITHUB_CLIENT_ID"),
      client_secret: System.get_env("GITHUB_CLIENT_SECRET"),
      redirect_uri: System.get_env("OAUTH_REDIRECT_URL"),
      site: "https://api.github.com",
      authorize_url: "https://github.com/login/oauth/authorize",
      token_url: "https://github.com/login/oauth/access_token"
    ]
  end

  def client do
    config()
    |> Client.new()
    |> Client.put_serializer("application/json", Jason)
  end

  def authorize_url!(params \\ []) do
    client()
    |> OAuth2.Client.authorize_url!(params)
  end

  def get_token!(params \\ [], headers \\ [], opts \\ []) do
    client()
    |> OAuth2.Client.get_token!(params, headers, opts)
  end

  def authorize_url(client, params) do
    OAuth2.Strategy.AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("accept", "application/json")
    |> OAuth2.Strategy.AuthCode.get_token(params, headers)
  end
end
