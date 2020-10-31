defmodule Ueberauth.Strategy.SlackV2Test do
  use ExUnit.Case, async: true
  use Plug.Test

  import Plug.Conn

  doctest Ueberauth.Strategy.SlackV2


  test "simple request phase" do
    {:ok, response_basic} =
      "test/support/fixtures/slack_v2_response_basic.html"
      |> Path.expand()
      |> File.read()

    conn =
      :get
      |> conn("/auth/slack")
      |> SpecRouter.call(@router)

    assert conn.resp_body == response_basic
  end

  test "advanced request phase" do
    {:ok, response_advanced} =
      "test/support/fixtures/slack_v2_response_advanced.html"
      |> Path.expand()
      |> File.read()

    conn =
      :get
      |> conn(
        "/auth/slack?scope=users:read&user_scope=dnd:write" <>
          "&state=obscure_custom_value&unknown_param=should_be_ignored"
      )
      |> SpecRouter.call(@router)

    assert conn.resp_body == response_advanced
  end
end
