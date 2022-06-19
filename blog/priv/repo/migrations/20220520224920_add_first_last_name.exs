defmodule Blog.Repo.Migrations.AddFirstLastName do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :firstname, :string, default: false
      add :lastname, :string, default: false
    end
  end
end
