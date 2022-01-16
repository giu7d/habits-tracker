defmodule HabitsTrackerWeb.UsersController do
  use HabitsTrackerWeb, :controller

  def auth_callback(conn, _params) do
    redirect(conn, external: HabitsTracker.auth_callback_user())
  end

  def auth(conn, %{"code" => code}) do
    with {:ok, token} <- HabitsTracker.auth_user(%{code: code}) do
      conn
      |> put_status(200)
      |> render("auth_user.json", %{token: token})
    else
      {:error, _} ->
        conn
        |> put_status(403)
        |> render("auth_unauthorized.json")
    end
  end

  def auth(conn, _) do
    conn
    |> put_status(400)
    |> render("auth_bad_request.json")
  end
end
