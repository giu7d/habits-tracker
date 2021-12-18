defmodule HabitsTrackerWeb.PageController do
  use HabitsTrackerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
