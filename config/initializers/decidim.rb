# frozen_string_literal: true

Decidim.configure do |config|
  # Basic App Info
  config.application_name = ENV.fetch("DECIDIM_APPLICATION_NAME", "Bauhaus4Med")
  config.mailer_sender = ENV.fetch("DECIDIM_MAILER_SENDER", "no-reply@b4m.space")

  # Locales
  config.available_locales = ENV.fetch("DECIDIM_AVAILABLE_LOCALES", "en,it,bg,el,bs").split(",").map(&:strip).map(&:to_sym)
  config.default_locale = ENV.fetch("DECIDIM_DEFAULT_LOCALE", "en").to_sym

  # Security & Networking
  config.system_accesslist_ips = ENV.fetch("DECIDIM_SYSTEM_ACCESS_IPS", "").split(",").map(&:strip)
  config.force_ssl = ENV.fetch("DECIDIM_FORCE_SSL", "true") == "true"
  config.cors_enabled = ENV.fetch("DECIDIM_CORS_ENABLED", "false") == "true"

  # Assets & UI
  config.service_worker_enabled = ENV.fetch("DECIDIM_SERVICE_WORKER_ENABLED", "false") == "true"
  config.page_blocks = ENV.fetch("DECIDIM_PAGE_BLOCKS", "terms-of-service").split(",").map(&:strip)
  config.image_uploader_quality = ENV.fetch("DECIDIM_IMAGE_QUALITY", "80").to_i
  config.maximum_attachment_size = ENV.fetch("DECIDIM_MAX_ATTACHMENT_SIZE", "10").to_i.megabytes
  config.maximum_avatar_size = ENV.fetch("DECIDIM_MAX_AVATAR_SIZE", "2").to_i.megabytes

  # Map and Geocoder Configuration
  # Note: 0.31 prefers this structured format
  if ENV["MAPS_STATIC_PROVIDER"].present?
    config.maps = {
      provider: ENV.fetch("MAPS_STATIC_PROVIDER", "osm").to_sym,
      api_key: ENV.fetch("MAPS_API_KEY", nil),
      static: { url: ENV.fetch("MAPS_STATIC_URL", "https://image.maps.hereapi.com/mia/v3/base/mc/overlay") },
      dynamic: {
        provider: ENV.fetch("MAPS_DYNAMIC_PROVIDER", "osm").to_sym,
        api_key: ENV.fetch("MAPS_DYNAMIC_API_KEY", nil),
        tile_layer: {
          url: ENV.fetch("MAPS_DYNAMIC_URL", nil),
          attribution: ENV.fetch("MAPS_ATTRIBUTION", nil)
        }.compact
      },
      geocoding: {
        host: ENV.fetch("MAPS_GEOCODING_HOST", nil),
        use_https: true
      }.compact
    }
  end

  # Throttling & Sessions
  config.throttling_max_requests = ENV.fetch("DECIDIM_THROTTLING_MAX", "100").to_i
  config.throttling_period = ENV.fetch("DECIDIM_THROTTLING_PERIOD", "1").to_i.minutes
  config.unconfirmed_access_for = ENV.fetch("DECIDIM_UNCONFIRMED_ACCESS_DAYS", "0").to_i.days
  config.expire_session_after = ENV.fetch("DECIDIM_SESSION_EXPIRY", "30").to_i.minutes

  # Admin Password Policy
  config.admin_password_strong = ENV.fetch("DECIDIM_ADMIN_STRONG_PW", "true") == "true"
  config.admin_password_expiration_days = ENV.fetch("DECIDIM_ADMIN_PW_EXPIRY", "90").to_i
  config.admin_password_min_length = ENV.fetch("DECIDIM_ADMIN_PW_MIN_LENGTH", "15").to_i

  # OmniAuth
  config.omniauth_providers = {
    decidim: {
      enabled: true,
      client_id: ENV.fetch("DECIDIM_CLIENT_ID", nil),
      client_secret: ENV.fetch("DECIDIM_CLIENT_SECRET", nil),
      site_url: ENV.fetch("DECIDIM_SITE_URL", nil)
    },
    facebook: { enabled: false },
    twitter: { enabled: false },
    google_oauth2: { enabled: false }
  }
end

# --- Module Specific Configurations ---

if Decidim.module_installed? :api
  Decidim::Api.configure do |config|
    config.schema_max_per_page = ENV.fetch("DECIDIM_API_MAX_PAGE", "50").to_i
  end
end

if Decidim.module_installed? :proposals
  Decidim::Proposals.configure do |config|
    config.participatory_space_highlighted_proposals_limit = ENV.fetch("DECIDIM_PROPOSALS_LIMIT", "4").to_i
  end
end

# Icons and Assets
Decidim.icons.register(name: "arrow-bottom", icon: "arrow-bottom", category: "system", engine: :core, description: "Directional arrow pointing down")
Decidim.icons.register(name: "audio", icon: "audio", category: "system", engine: :core, description: "Audio content icon")
Decidim.icons.register(name: "link-intact", icon: "link-intact", category: "system", engine: :core, description: "Hyperlink icon")
Decidim.icons.register(name: "decidim-fill", icon: "decidim-fill", category: "system", engine: :core, description: "Decidim brand logo")

Rails.application.config.i18n.available_locales = Decidim.available_locales
Rails.application.config.i18n.default_locale = Decidim.default_locale
Decidim.register_assets_path File.expand_path("app/packs", Rails.application.root)
