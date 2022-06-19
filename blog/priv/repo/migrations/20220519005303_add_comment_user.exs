defmodule Blog.Repo.Migrations.AddCommentUser do
  use Ecto.Migration

  def change do
    alter table("posts") do

      remove :writer
      add :user_id, references("users")
    end
    alter table("comments") do
      add :user_id, references("users")
    end

  end
end
