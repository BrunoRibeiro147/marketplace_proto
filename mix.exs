defmodule MarketplaceProto.MixProject do
  use Mix.Project

  def project do
    [
      app: :marketplace_proto,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application, do: [application: [:grpc]]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:grpc, "~> 0.5.0"},
      {:protobuf, "~> 0.11"}
    ]
  end
end
