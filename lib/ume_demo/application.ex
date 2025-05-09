defmodule UmeDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # Connect Node. 
    Node.connect(:"crash24@127.0.0.1")

    children = [
      {Phoenix.PubSub, name: FlightTracker.PubSub},
      UmeDemo.Super,
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UmeDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
