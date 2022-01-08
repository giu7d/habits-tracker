defmodule HabitsTrackerWeb.UsersController do
  use HabitsTrackerWeb, :controller

  alias HabitsTracker.Models.User

  def create(conn, params) do
    with {:ok, %User{} = user} <- HabitsTracker.create_user(params) do
      IO.inspect("HabitsTrackerWeb.UsersController")
      IO.inspect(user)

      conn
      |> put_status(:created)
      |> render("create_user.json", %{user: user})
    end
  end
end
