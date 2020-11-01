use Mix.Config

config :ueberauth, Ueberauth,
  json_library: Jason,
  providers: [
    slack: {Ueberauth.Strategy.SlackV2, [
               default_scope: "users:write",
               default_user_scope: "dnd:write"
             ]}
  ]

config :ueberauth, Ueberauth.Strategy.SlackV2.OAuth,
  client_id: "clientidsomethingrandom",
  client_secret: "clientsecret-somethingsecret"

config :plug, :validate_header_keys_during_test, true
