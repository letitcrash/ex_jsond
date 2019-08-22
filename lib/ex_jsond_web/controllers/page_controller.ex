defmodule ExJsondWeb.PageController do
  use ExJsondWeb, :controller
  alias Phoenix.LiveView
  alias ExJsondWeb.IndexLive

  def index(conn, _params) do
    # render(conn, "index.html")
    LiveView.Controller.live_render(conn, ExJsondWeb.LiveIndex, session: %{})
  end
end
