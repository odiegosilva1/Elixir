defmodule Projectphx01.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Projectphx01Web.Telemetry,
      {DNSCluster, query: Application.get_env(:projectphx01, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Projectphx01.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Projectphx01.Finch},
      # Start a worker by calling: Projectphx01.Worker.start_link(arg)
      # {Projectphx01.Worker, arg},
      # Start to serve requests, typically the last entry
      Projectphx01Web.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Projectphx01.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Projectphx01Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
