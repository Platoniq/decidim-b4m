# frozen_string_literal: true

Decidim.configure do |config|
  config.omniauth_providers = {
    decidim: {
      enabled: true,
      client_id: ENV.fetch("DECIDIM_CLIENT_ID", nil),
      client_secret: ENV.fetch("DECIDIM_CLIENT_SECRET", nil),
      site_url: ENV.fetch("DECIDIM_SITE_URL", nil)
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

Decidim.icons.register(name: "arrow-bottom", icon: "arrow-bottom", category: "system", description: "", engine: :core)
Decidim.icons.register(name: "audio", icon: "audio", category: "system", description: "", engine: :core)
Decidim.icons.register(name: "link-intact", icon: "link-intact", category: "system", description: "", engine: :core)
Decidim.icons.register(name: "decidim-fill", icon: "decidim-fill", category: "system", description: "", engine: :core)
