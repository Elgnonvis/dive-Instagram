require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module AppInstagram
  class Application < Rails::Application

    config.time_zone = 'West Central Africa'
    config.active_record.default_timezone = :local
    # config.i18n.default_locale = :fr
    
    config.load_defaults 5.2

    config.generators do |g|
      g.assets false
      g.helper false
      g.jbuilder false
    end
  end
end
