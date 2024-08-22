defmodule Components.DatePicker do
  use Phoenix.Component

  attr :check_in, :string, default: nil
  attr :check_out, :string, default: nil
  attr :price_per_night, :float, required: true

  def date_picker(assigns) do
    days = calculate_days(assigns.check_in, assigns.check_out)
    total_price = days * assigns.price_per_night

    ~H"""
    <div class="p-4 bg-gray-100 rounded shadow-md">
      <!-- Campos de data para check-in e check-out -->
      <form phx-change="update_dates">
        <div class="flex gap-4">
          <div>
            <label for="check_in" class="block text-sm font-medium text-gray-700">Check-in</label>
            <input
              type="date"
              id="check_in"
              name="check_in"
              value={@check_in}
              class="mt-1 block w-full rounded-md border border-gray-300 bg-white py-2 px-3 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
            />
          </div>
          <div>
            <label for="check_out" class="block text-sm font-medium text-gray-700">Check-out</label>
            <input
              type="date"
              id="check_out"
              name="check_out"
              value={@check_out}
              class="mt-1 block w-full rounded-md border border-gray-300 bg-white py-2 px-3 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
            />
          </div>
        </div>
      </form>

      <div class="mt-4">
        <p class="text-xl font-semibold">Total Price: <%= total_price %> USD</p>
        <p class="text-sm text-gray-500">
          <%= days %> nights at <%= assigns.price_per_night %> USD per night
        </p>
      </div>
    </div>
    """
  end

  defp calculate_days(nil, _), do: 0
  defp calculate_days(_, nil), do: 0

  defp calculate_days(check_in, check_out) do
    case {Date.from_iso8601(check_in), Date.from_iso8601(check_out)} do
      {{:ok, check_in_date}, {:ok, check_out_date}} ->
        Date.diff(check_out_date, check_in_date)

      _ ->
        0
    end
  end
end
