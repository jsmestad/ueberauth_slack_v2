use Mix.Config

config :ueberauth, Ueberauth,
  json_library: Jason,
  providers: [
    auth0: {Ueberauth.Strategy.SlackV2, []}
  ]

config :ueberauth, Ueberauth.Strategy.SlackV2.OAuth,
  client_id: "clientidsomethingrandom",
  client_secret: "clientsecret-somethingsecret"

config :plug, :validate_header_keys_during_test, true
