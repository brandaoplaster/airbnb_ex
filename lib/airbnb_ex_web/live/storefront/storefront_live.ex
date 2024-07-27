defmodule AirbnbExWeb.Storefront.StorefrontLive do
  use AirbnbExWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
      <.container_main class="grid sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 justify-center items-center">
        <%= Enum.map(1..18, fn _ -> %>
          <.link>
            <.card class="max-w-xs mx-4 mb-2 rounded-md h-96">
              <.card_media src="https://v1.tailwindcss.com/img/card-top.jpg" class="h-52 rounded-lg" />
              <.card_body class="p-1">
                <.card_header class="font-semibold text-base mb-2">
                  <span>The Coldest Sunset</span>
                  <span class="pl-8"> 4,73(45) </span>
                </.card_header>
                <span class="text-base text-gray-500">Loft in the heart of Venice</span> <br />
                <span class="text-base text-gray-500">15-22 de mar.</span>
              </.card_body>
              <.card_footer class="p-1">
                <span class="font-bold">R$ 135</span> noite
              </.card_footer>
            </.card>
          </.link>
        <% end) %>
      </.container_main>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
