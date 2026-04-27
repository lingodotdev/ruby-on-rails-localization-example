require_relative "boot"

require "rails"
require "action_controller/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module RailsLocalizationExample
  class Application < Rails::Application
    config.load_defaults 7.2

    config.i18n.available_locales = [:en, :es, :fr, :de]
    config.i18n.default_locale = :en
    config.i18n.fallbacks = [:en]
  end
end
