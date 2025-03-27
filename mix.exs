defmodule UmeDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :ume_demo,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {UmeDemo.Application, []},
      extra_applications: [:logger, :wx, :observer, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:aircraft, path: "/home/drobban/code/elixir/aircraft"},
      {:sam_site, path: "/home/drobban/code/elixir/sam_site"},
      {:flight_control, path: "/home/drobban/code/elixir/flight_control"},
      {:phoenix, "~> 1.7.18"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get"],
      test: ["test"],
      "assets.setup": [],
      "assets.build": [],
      "assets.deploy": [
      ]
    ]
  end
end
