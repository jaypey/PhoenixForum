defmodule Blog.Repo.Migrations.AddPostFK do
  use Ecto.Migration

  def change do
    alter table("posts") do
      add :writer, references("users")
    end
  end
end
