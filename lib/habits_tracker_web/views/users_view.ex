defmodule HabitsTrackerWeb.UsersView do
  alias HabitsTracker.Models.User

  def render("create_user.json", %{
        user: %User{} = user
      }) do
    %{
      message: "User created",
      user: %{
        id: user.id,
        name: user.name,
        email: user.email
      }
    }
  end
end
