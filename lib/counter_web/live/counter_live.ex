defmodule CounterWeb.CounterLive do
  use Phoenix.LiveView

  def mount(_session, _, socket) do
    socket = assign(socket, :count, 0)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Count : <%= @count %></h1>
    <button phx-click="increment">+</button>
    <button phx-click="decrement">-</button>
    <button phx-click="double">double</button>
    <button phx-click="reset">reset</button>
    """
  end

  def handle_event("increment", _value, socket) do
    count = socket.assigns.count + 1
    socket = assign(socket, :count, count)
    {:noreply, socket}
  end

  def handle_event("decrement", _value, socket) do
    count = socket.assigns.count - 1
    socket = assign(socket, :count, count)
    {:noreply, socket}
  end

  def handle_event("reset", _value, socket) do
    count = 0
    socket = assign(socket, :count, count)
    {:noreply, socket}
  end

  def handle_event("double", _value, socket) do
    count = socket.assigns.count * 2
    socket = assign(socket, :count, count)
    {:noreply, socket}
  end

end
