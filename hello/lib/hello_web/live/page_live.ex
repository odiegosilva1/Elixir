defmodule HelloWeb.PageLive do
  use HelloWeb, :live_view

  def mount(_params, _sessions, socket) do
    {:ok, socket}

  end

  def render(assigns) do
    ~H"""
    Hello World!
    """
  end
end
