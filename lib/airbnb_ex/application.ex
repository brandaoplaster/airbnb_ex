defmodule AirbnbEx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AirbnbExWeb.Telemetry,
      # Start the Ecto repository
      AirbnbEx.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: AirbnbEx.PubSub},
      # Start Finch
      {Finch, name: AirbnbEx.Finch},
      # Start the Endpoint (http/https)
      AirbnbExWeb.Endpoint
      # Start a worker by calling: AirbnbEx.Worker.start_link(arg)
      # {AirbnbEx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AirbnbEx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AirbnbExWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
