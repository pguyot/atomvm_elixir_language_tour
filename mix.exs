# Copyright 2023 Paul Guyot <pguyot@kallisys.net>
# SPDX-License-Identifier: Apache-2.0 OR LGPL-2.1-or-later

defmodule ElixirLanguageTour.MixProject do
  use Mix.Project

  def project do
    [
      app: :ElixirLanguageTour,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      atomvm: [
        start: ElixirLanguageTour
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:exatomvm, git: "https://github.com/atomvm/ExAtomVM/"}
    ]
  end
end
