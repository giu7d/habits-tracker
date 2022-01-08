defmodule HabitsTracker.Users.Create do
  alias Ecto.Multi
  alias HabitsTracker.Models.User
  alias HabitsTracker.Repo

  def execute(params) do
    Multi.new()
    |> Multi.insert(:create_user, User.changeset(params))
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, response, _changes} -> {:error, response}
      {:ok, %{create_user: user}} -> {:ok, user}
    end
  end
end
