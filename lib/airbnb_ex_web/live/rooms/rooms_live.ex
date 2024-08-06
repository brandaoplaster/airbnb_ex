defmodule AirbnbExWeb.Rooms.RoomsLive do
  use AirbnbExWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="min-h-screen grid grid-rows-4 gap-4 p-4">
      <.section class="bg-white p-4 shadow-md">
        <.header class="text-left ml-9 m-4">
          Metropolitian Studio with Cityscape, Pool and Gym
        </.header>
        <.banner />
      </.section>
      <div class="bg-white p-4 shadow-md">Linha 1</div>
      <div class="bg-white p-4 shadow-md grid grid-cols-2 gap-4">
        <div class="bg-blue-100 p-4">Coluna 1 da Linha 2</div>
        <div class="bg-blue-200 p-4">Coluna 2 da Linha 2</div>
      </div>
      <div class="bg-white p-4 shadow-md">Linha 3</div>
      <div class="bg-white p-4 shadow-md">Linha 4</div>
    </div>
    """
  end
end
