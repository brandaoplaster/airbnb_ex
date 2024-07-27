defmodule Components.Section do
  use Phoenix.Component

  attr :class, :string, default: nil
  attr :src, :string, default: nil

  slot :inner_block, required: true

  def banner(assigns) do
    ~H"""
    <section class={[@class]}>
      <%= render_slot(@inner_block) %>
    </section>
    """
  end
end
