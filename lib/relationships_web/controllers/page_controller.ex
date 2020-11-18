defmodule RelationshipsWeb.PageController do
  use RelationshipsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
