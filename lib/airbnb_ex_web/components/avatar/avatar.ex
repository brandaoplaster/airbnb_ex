defmodule Components.Avatar do
  use Phoenix.Component

  import Components.Icon

  attr :class, :string, default: nil
  attr :src, :string, default: nil

  def avatar(assigns) do
    ~H"""
    <div class={[@class]}>
      <%= if is_nil(@src) do %>
        <.icon name="hero-user-circle-mini" class="h-10 w-12 rounded-full" />
      <% else %>
        <img src={@src} class="h-10 w-12 rounded-full" />
      <% end %>
    </div>
    """
  end
end
