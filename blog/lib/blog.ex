defmodule Blog do
  @moduledoc """
  Blog keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  @behaviour Bodyguard.Policy

  #Admin
  def authorize(_, %Blog.Accounts.User{is_admin: true}, _), do: true

  # Regular users
  def authorize(action, _, _)
    when action in [:index, :create, :add_comment], do: true

  # def authorize(action, %Blog.Accounts.User{id: user_id}, %Blog.Posts.Post{writer: user})
  #   when action in [:edit, :delete], do: true

end
