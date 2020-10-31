defmodule UeberauthSlackV2.Mixfile do
  use Mix.Project

  @version "1.0.0"

  def project do
    [
      app: :ueberauth_slack_v2,
      version: @version,
      name: "Ueberauth Slack V2",
      package: package(),
      elixir: "~> 1.7",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/jsmestad/ueberauth_slack_v2",
      homepage_url: "https://github.com/jsmestad/ueberauth_slack_v2",
      description: "An Ueberauth strategy for using Slack OAuth V2 to authenticate your users",
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [applications: [:logger, :ueberauth, :oauth2]]
  end

  defp deps do
    [
      {:oauth2, "~> 1.0 or ~> 2.0"},
      {:ueberauth, "~> 0.6"},
      {:jason, "~> 1.0"},

      # dev/test dependencies
      {:credo, "~> 1.5", only: [:dev, :test]},
      {:earmark, "~> 1.3", only: :dev},
      {:ex_doc, "~> 0.21", only: :dev}
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "README",
      canonical: "http://hexdocs.pm/ueberauth_slack_v2",
      source_url: "https://github.com/jsmestad/ueberauth_slack_v2",
      extras: [
        "README.md": [filename: "README"],
        "CHANGELOG.md": [filename: "CHANGELOG"]
      ]
    ]
  end

  defp package do
    [
      files: ~w(lib LICENSE mix.exs README.md),
      maintainers: ["Justin Smestad"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/jsmestad/ueberauth_slack_v2"}
    ]
  end
end
