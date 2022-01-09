defmodule HabitsTracker do
  defdelegate create_user(params), to: HabitsTracker.Users.Create, as: :execute

  defdelegate auth_user(params), to: HabitsTracker.Users.Auth, as: :execute
end
