defmodule ExJsondWeb.LiveIndex do
  use Phoenix.LiveView

  def mount(_session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    Greetings from Live View
    """
  end
end
