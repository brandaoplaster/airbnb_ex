defmodule Components.Card do
  use Phoenix.Component

  @doc """
  Renders a card.

  ## Examples

      <.card>...Send!....</.card>
  """
  attr :type, :string
  attr :class, :string

  slot :inner_block, required: true

  def card(assigns) do
    ~H"""
    <div class={[@class]}>
      <%!-- <div class="px-6 py-4">
        <div class="font-bold text-xl mb-2">The Coldest Sunset</div>
        <p class="text-gray-700 text-base">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit.
        </p>
      </div> --%>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :class, :string, default: nil
  slot :inner_block, required: false

  def card_body(assigns) do
    ~H"""
    <div class={[@class]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :src, :string, required: true
  attr :alt, :string, default: "image card"
  attr :class, :string, default: nil

  def card_media(assigns) do
    ~H"""
    <img class={[@class]} src={@src} alt={@alt} />
    """
  end

  attr :class, :string, default: nil
  slot :inner_block, required: false

  def card_header(assigns) do
    ~H"""
    <div class={[@class]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def card_footer(assigns) do
    ~H"""
    <div {@rest} class={[@class]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
