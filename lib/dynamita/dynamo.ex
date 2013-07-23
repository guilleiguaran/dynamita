defmodule Dynamita.Dynamo do
  use Dynamo

  config :dynamo,
    # The environment this Dynamo runs on
    env: Mix.env,

    # The OTP application associated to this Dynamo
    otp_app: :dynamita,

    # The endpoint to dispatch requests to
    endpoint: ApplicationRouter,

    # The route from where static assets are served
    # You can turn off static assets by setting it to false
    static_route: "/"

  # Uncomment the lines below to enable the cookie session store
  # config :dynamo,
  #   session_store: Session.CookieStore,
  #   session_options:
  #     [ key: "_dynamita_session",
  #       secret: "zUTorLN+V7KiWUB/GPMQikIrZDKaa1S4f+klzTEaHbAC7+TiZre6z6WFU8eHaRnX"]

  # Default functionality available in templates
  templates do
    use Dynamo.Helpers
  end
end
