defmodule HabitsTrackerWeb.UsersView do
  def render("auth_user.json", %{
        token: token
      }) do
    token
  end

  def render("auth_unauthorized.json", _) do
    %{
      message: "Authorization token is undefined or invalid"
    }
  end

  def render("auth_bad_request.json", _) do
    %{
      message: "Missing url parameter: code"
    }
  end
end
