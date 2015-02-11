Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
            Rails.application.secrets.google['client_id'],
            Rails.application.secrets.google['client_secret'],
            {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
