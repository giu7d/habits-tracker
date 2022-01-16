defmodule HabitsTracker do
  defdelegate auth_user(params), to: HabitsTracker.Users.Auth, as: :execute

  defdelegate auth_callback_user(), to: HabitsTracker.Users.AuthCallback, as: :execute
end
