defmodule HabitsTrackerWeb.UsersController do
  use HabitsTrackerWeb, :controller

  alias HabitsTracker.Models.User
  alias HabitsTracker.Provider.OAuth

  def create(conn, params) do
    with {:ok, %User{} = user} <- HabitsTracker.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create_user.json", %{user: user})
    end
  end

  def auth(conn, _params) do
    redirect(conn, external: OAuth.GitHub.authorize_url!())
  end

  def auth_callback(conn, %{"code" => code}) do
    with {:ok, token} <- HabitsTracker.auth_user(%{code: code}) do
      conn
      |> put_status(:created)
      |> render("auth_user.json", %{token: token})
    end
  end
end
