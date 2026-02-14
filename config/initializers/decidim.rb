# frozen_string_literal: true

Decidim.configure do |config|
  # Sets the list of available locales for the whole application.
  #
  # When an organization is created through the System area, system admins will
  # be able to choose the available languages for that organization. That list
  # of languages will be equal or a subset of the list in this file.
  config.available_locales = ENV.fetch("DECIDIM_AVAILABLE_LOCALES", "en,it,bg,el,bs").split(",").map(&:strip).map(&:to_sym)
  # Or block set it up manually and prevent ENV manipulation:
  # config.available_locales = %w(en ca es)

  # Sets the default locale for new organizations. When creating a new
  # organization from the System area, system admins will be able to overwrite
  # this value for that specific organization.
  config.default_locale = ENV.fetch("DECIDIM_DEFAULT_LOCALE", "en").to_sym

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
