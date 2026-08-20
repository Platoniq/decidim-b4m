# frozen_string_literal: true

# Rails 7.1 removed Rails.application.secrets, which this app still reads in
# many places. config/secrets.yml already has the shape config_for expects.
Rails.application.singleton_class.prepend(Module.new do
  def secrets
    @secrets ||= ActiveSupport::OrderedOptions.new.merge(
      config_for(:secrets).deep_symbolize_keys
    )
  end
end)
