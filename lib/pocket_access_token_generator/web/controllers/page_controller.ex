defmodule Pocket.Web.PageController do
  use Pocket.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def authorize(conn, %{"form" => form}) do
    consumer_key = form["consumer_key"]
    auth_url = Pocket.Web.Lol.authorize(consumer_key)

    redirect conn, external: auth_url
  end

end
