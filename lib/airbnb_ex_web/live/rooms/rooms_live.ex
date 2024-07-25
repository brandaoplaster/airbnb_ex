defmodule AirbnbExWeb.Rooms.RoomsLive do
  use AirbnbExWeb, :live_view

  def render(assigns) do
    ~H"""
    <.banner />
    <.card class="max-w-xs mx-4 mb-2 rounded-md h-96 float-left">
      <.header class="text-center">
        Sign in to account
        <:subtitle>
          Don't have an account?
          <.link navigate={~p"/users/register"} class="font-semibold text-brand hover:underline">
            Sign up
          </.link>
          for an account now.
        </:subtitle>
      </.header>
    </.card>
    """
  end
end
