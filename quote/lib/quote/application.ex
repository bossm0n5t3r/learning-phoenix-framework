defmodule Quote.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      QuoteWeb.Telemetry,
      Quote.Repo,
      {DNSCluster, query: Application.get_env(:quote, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Quote.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Quote.Finch},
      # Start a worker by calling: Quote.Worker.start_link(arg)
      # {Quote.Worker, arg},
      # Start to serve requests, typically the last entry
      QuoteWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Quote.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    QuoteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
