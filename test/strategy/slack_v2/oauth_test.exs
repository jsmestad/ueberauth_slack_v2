defmodule Ueberauth.Strategy.SlackV2.OAuthTest do
  use ExUnit.Case, async: true

  alias Ueberauth.Strategy.SlackV2.OAuth

  import Ueberauth.Strategy.SlackV2.OAuth, only: [client: 0]

  # setup do
  #   {:ok, %{client: client()}}
  # end

  test "creates correct client" do
    client = client()
    assert client.client_id == "clientidsomethingrandom"
    assert client.client_secret == "clientsecret-somethingsecret"
    assert client.redirect_uri == ""
    assert client.strategy == Ueberauth.Strategy.SlackV2.OAuth
    assert client.authorize_url == "https://slack.com/oauth/v2/authorize"
    assert client.token_url == "https://slack.com/api/oauth.v2.access"
    assert client.site == "https://localhost:3000/api"
  end

  describe "get_token!/2" do
    setup do
      bypass = Bypass.open(port: 3000)
      {:ok, bypass: bypass}
    end

    test "returning a bot token with embedded user token", %{bypass: bypass} do
      Bypass.expect_once(bypass, "POST", "/api/oauth.v2.access", fn conn ->
        conn
        |> Plug.Conn.put_resp_content_type("application/json")
        |> Plug.Conn.resp(200, FixtureHelper.read("oauth.v2.access"))
      end)

      assert %{} == OAuth.get_token!()
    end
  end
end
