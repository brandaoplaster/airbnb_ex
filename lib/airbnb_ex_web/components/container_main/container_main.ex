defmodule AirbnbExWeb.ContainerMain do
  use Phoenix.Component

  @doc """
  Renders a button.

  ## Examples

      <.container_main>...send...</.container_main>
  """
  attr(:class, :string, default: nil)

  slot :inner_block, required: true

  def container_main(assigns) do
    ~H"""
    <main class={[@class]}>
      <%= render_slot(@inner_block) %>
    </main>
    """
  end
end
