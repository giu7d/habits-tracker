defmodule HabitsTracker do
  defdelegate create_user(params), to: HabitsTracker.Users.Create, as: :execute
end
