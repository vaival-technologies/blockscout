import Config

# Do not print debug messages in production

config :logger, :console, level: :info

config :logger, :ecto,
  level: :info,
  path: Path.absname("logs/prod/ecto.log"),
  rotate: %{max_bytes: 52_428_800, keep: 19}

config :logger, :error,
  path: Path.absname("logs/prod/error.log"),
  rotate: %{max_bytes: 52_428_800, keep: 19}

# System.get_env("ETHEREUM_JSONRPC_HTTP_URL")
# config :ethereumex, url: System.get_env("FAUCET_JSONRPC_HTTP_URL")

config :ex_twilio,
  account_sid: {:system, "TWILIO_ACCOUNT_SID"},
  auth_token: {:system, "TWILIO_AUTH_TOKEN"}

config :sentry,
  dsn: "https://fd7dceeeb4dd4fe1a0960a26d7d1260f@o1222505.ingest.sentry.io/6366450",
  environment_name: :prod,
  enable_source_code_context: true,
  root_source_code_path: File.cwd!(),
  tags: %{
    env: "production"
  },
  included_environments: [:prod]
