# frozen_string_literal: true

Decidim.configure do |config|
  config.omniauth_providers = {
    decidim: {
      enabled: true,
      client_id:  ENV["DECIDIM_CLIENT_ID"],
      client_secret: ENV["DECIDIM_CLIENT_SECRET"],
      site_url: ENV["DECIDIM_SITE_URL"]
    },
    facebook: {
      enabled: false
    },
    twitter: {
      enabled: false
    },
    google_oauth2: {
      enabled: false
    }
  }
end

Decidim.icons.register(name: "decidim-fill", icon: "decidim-fill", category: "system", description: "", engine: :core)