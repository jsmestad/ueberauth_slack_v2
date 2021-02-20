defmodule SpecRouter do
  # Credit goes to:
  # https://github.com/he9qi/ueberauth_weibo/blob/master/test/test_helper.exs
  # and
  # https://github.com/ueberauth/ueberauth_vk/blob/master/test/test_helper.exs

  require Ueberauth
  use Plug.Router

  plug(:fetch_query_params)

  plug(Ueberauth, base_path: "/auth")

  plug(:match)
  plug(:dispatch)

  get("/auth/slack", do: send_resp(conn, 200, "slack request"))

  get("/auth/slack/callback", do: send_resp(conn, 200, "slack callback"))
end

defmodule FixtureHelper do
  def read(file) do
    "test/support/fixtures/#{file}.json"
    |> Path.expand()
    |> File.read!()
    |> Jason.decode!()
  end
end

ExUnit.start()
