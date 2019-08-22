defmodule ExJsondWeb.LiveIndex do
  use Phoenix.LiveView
  alias ExJsondWeb.Router.Helpers, as: Routes

  def mount(_session, socket) do
    {:ok, assign(socket, json: "")}
  end

  def render(assigns) do
    ExJsondWeb.PageView.render("index.html", assigns)
  end

  def handle_event("save", %{"input" => input}, socket) do
    {s, _} = Code.eval_string(input)

    case Jason.encode(s, pretty: true) do
      {:ok, json} ->
        socket =
          socket
          |> assign(json: json)
          |> assign(input: input)

        {:noreply, socket}

      {:error, reason} ->
        socket =
          socket
          |> assign(json: "Error: #{inspect(reason)}")
          |> assign(input: input)

        {:noreply, socket}
    end
  end
end
