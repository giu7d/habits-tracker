defmodule HabitsTracker.Users.Auth do
  alias HabitsTracker.Provider.OAuth

  def execute(%{code: code}) do
    OAuth.GitHub.get_token!(code: code)
  end
end
