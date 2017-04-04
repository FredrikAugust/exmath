defmodule Exmath.Mixfile do
  use Mix.Project

  def project do
    [app: :exmath,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  defp deps do
    []
  end

  defp description do
    """
    A library for performing some math operations that I frequently use in maths at school. Mainly related to probabilistic maths.
    """
  end

  defp package do
    [
      name: :exmath,
      files: ["lib", "mix.exs", "README*", "LICENSE"],
      maintainers: ["Fredrik August Madsen-Malmo"],
      licenses: ["MIT License"],
      links: %{"github" => "https://github.com/fredrikaugust/exmath"}
    ]
  end
end
