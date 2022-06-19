defmodule BlogWeb.PostView do
  use BlogWeb, :view
  alias Blog.Posts

  def get_comments_count(post_id) do
    Posts.get_number_of_comments(post_id)
  end

  def commentClass(pageNb) do
    "page page#{pageNb}"
  end

  def incrementPage(currentPage, index) do
    if div(index, 5*currentPage) == 1 do
      currentPage + 1
    else
      currentPage
    end
  end

  def showDelete(conn, commentUserId) do
    !conn.assigns.current_user.is_admin && conn.assigns.current_user.id != commentUserId
  end

end
