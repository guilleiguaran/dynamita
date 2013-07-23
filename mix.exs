defmodule Dynamita.Mixfile do
  use Mix.Project

  def project do
    [ app: :dynamita,
      version: "0.0.1",
      dynamos: [Dynamita.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/dynamita/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { Dynamita, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "0.1.0.dev", github: "elixir-lang/dynamo" },
      { :ecto, "0.0.1", github: "elixir-lang/ecto" },
      { :pgsql, github: "semiocast/pgsql" } ]
  end
end
