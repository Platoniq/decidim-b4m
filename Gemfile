# frozen_string_literal: true

source "https://rubygems.org"

DECIDIM_VERSION = "0.28.5"

ruby RUBY_VERSION

gem "decidim", DECIDIM_VERSION

gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-decidim_awesome"
gem "decidim-social_crowdfunding", git: "https://github.com/Platoniq/decidim-module-social_crowdfunding", branch: "main"
gem "decidim-superspaces", git: "https://github.com/Platoniq/decidim-superspace", branch: "main"
gem "decidim-templates"
gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer", branch: "main"

gem "faraday", "~> 2.9.0"

gem "bootsnap", "~> 1.3"

gem "puma", ">= 6.3.1"

gem "wicked_pdf", "~> 2.1"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "brakeman", "~> 5.4"
  gem "decidim-dev", DECIDIM_VERSION
  gem "mdl"
  gem "net-imap", "~> 0.2.3"
  gem "net-pop", "~> 0.1.1"
  gem "net-smtp", "~> 0.3.1"
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
end

group :production do
  gem "aws-sdk-s3", require: false
  gem "figaro", "~> 1.2"
  gem "passenger", "~> 6.0"
  gem "sidekiq"
end
