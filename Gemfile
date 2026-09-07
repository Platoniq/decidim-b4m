# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "0.31.7"

gem "decidim", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-decidim_awesome", git: "https://github.com/decidim-ice/decidim-module-decidim_awesome", branch: "main"
gem "decidim-initiatives", DECIDIM_VERSION
gem "decidim-meetings", DECIDIM_VERSION
gem "decidim-social_crowdfunding", git: "https://github.com/Platoniq/decidim-module-social_crowdfunding", branch: "deps/decidim-0.31"
gem "decidim-superspaces", git: "https://github.com/Platoniq/decidim-superspace", branch: "deps/decidim-0.31"
gem "decidim-templates", DECIDIM_VERSION
gem "decidim-term_customizer", github: "openpoke/decidim-module-term_customizer", branch: "release/0.31-stable"

gem "omniauth-decidim"

gem "appsignal"

gem "faraday", "~> 2.9.0"

gem "bootsnap", "~> 1.3"

gem "puma", ">= 6.3.1"
gem "rack-attack", "~> 6.7"

gem "wicked_pdf", "~> 2.1"

gem "aws-sdk-core", "3.214.1"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "brakeman", "~> 5.4"
  gem "decidim-dev", DECIDIM_VERSION
  gem "mdl"
  gem "net-imap", "~> 0.2.3"
  gem "net-pop", "~> 0.1.1"
  gem "net-smtp", "~> 0.5.0"
end

group :development do
  gem "letter_opener_web", "~> 2.0"
  gem "listen", "~> 3.1"
  gem "web-console", "~> 4.2"

  gem "capistrano", "~> 3.18"
  gem "capistrano-bundler"
  gem "capistrano-passenger"
  gem "capistrano-rails", "~> 1.6"
  gem "capistrano-rails-console"
  gem "capistrano-rbenv"
  gem "capistrano-sidekiq"

  gem "faker"
end

group :production do
  gem "aws-sdk-s3", require: false
  gem "figaro", "~> 1.2"
  gem "passenger", "~> 6.0"
  gem "sidekiq"
end
