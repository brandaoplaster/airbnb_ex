defmodule Components.Dropdown do
  use Phoenix.Component

  import Components.Icon
  alias Phoenix.LiveView.JS

  @transition_in_base "transition transform ease-out duration-100"
  @transition_in_start "transform opacity-0 scale-95"
  @transition_in_end "transform opacity-100 scale-100"

  @transition_out_base "transition ease-in duration-75"
  @transition_out_start "transform opacity-100 scale-100"
  @transition_out_end "transform opacity-0 scale-95"

  attr :component_id, :string
  attr :label, :string, default: nil, doc: "labels for dropdown"
  attr :class, :string, default: "", doc: "CSS class"
  attr :rest, :global

  slot :trigger_element
  slot :inner_block, required: false

  @doc """
    <.dropdown label="menu">
      <.dropdown_menu to="/" label="menu A" />
      <.dropdown_menu to="/" disabled label="disabled item" />
      <.dropdown_menu to="/" label="menu 2" />
      <.dropdown_menu to="/" label="menu B" />
    </.dropdown>
  """
  def dropdown(assigns) do
    assigns =
      assigns
      |> assign_new(:component_id, fn -> "dropdown_#{Enum.random(1..999)}" end)

    ~H"""
    <div {@rest} {phx_action(@component_id, "hide")}>
      <button type="button" {phx_action(@component_id, "toggle")} aria-haspopup="true">
        <span class="sr-only">Open options</span>

        <%= if @label do %>
          <%= @label %>
          <.icon name="hero-chevron-down" class="h-4 w-4" />
        <% end %>

        <%= if @trigger_element do %>
          <%= render_slot(@trigger_element) %>
        <% end %>

        <%= if !@label && @trigger_element == [] do %>
          <.icon name="hero-bars-3" class="h-5 w-5" />
        <% end %>
      </button>

      <div
        class="absolute right-0 z-10 mt-2 w-56 origin-top-right rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
        {apply_style()}
        role="menu"
        id={@component_id}
        aria-orientation="vertical"
        aria-labelledby="options-menu"
      >
        <div class="py-1" role="none">
          <%= render_slot(@inner_block) %>
        </div>
      </div>
    </div>
    """
  end

  attr :to, :string, default: nil, doc: "link path"
  attr :label, :string, doc: "link label"
  attr :class, :string, default: "", doc: "CSS classes"
  attr :disabled, :boolean, default: false

  attr :rest, :global, include: ~w(method download hreflang ping referrerpolicy rel target type)
  slot :inner_block, required: false

  def dropdown_menu(assigns) do
    ~H"""
    <a to={@to} class={[@class]} disabled={@disabled} {@rest}>
      <%= render_slot(@inner_block) || @label %>
    </a>
    """
  end

  defp phx_action(component_id, "hide") do
    %{
      "phx-click-away":
        JS.hide(
          to: "##{component_id}",
          transition: {@transition_out_base, @transition_out_start, @transition_out_end}
        )
    }
  end

  defp phx_action(component_id, "toggle") do
    %{
      "phx-click":
        JS.toggle(
          to: "##{component_id}",
          display: "block",
          in: {@transition_in_base, @transition_in_start, @transition_in_end},
          out: {@transition_out_base, @transition_out_start, @transition_out_end}
        )
    }
  end

  defp apply_style do
    %{style: "display: none;"}
  end
end
