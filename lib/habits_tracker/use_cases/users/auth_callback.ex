defmodule HabitsTracker.Users.AuthCallback do
  alias HabitsTracker.Provider.OAuth

  def execute() do
    OAuth.GitHub.authorize_url!()
  end
end
