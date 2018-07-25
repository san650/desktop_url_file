defmodule DesktopUrlFile.MixProject do
  use Mix.Project

  def project do
    [
      app: :desktop_url_file,
      deps: deps(),
      description: description(),
      elixir: "~> 1.4",
      source_url: "https://github.com/san650/desktop_url_file",
      start_permanent: Mix.env() == :prod,
      version: "0.1.0",
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end

  defp description do
    """
    Library for generating desktop url files that points to websites. These files are supported by Windows and OSX operating systems.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/san650/desktop_url_file"},
      maintainers: ["Santiago Ferreira"],
      name: :desktop_url_file,
    ]
  end
end
