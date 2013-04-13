require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
%w[
  action_controller
  action_mailer
  active_record
  active_resource
  sprockets
].each { |f| require "#{ f }/railtie" }


if defined?(Bundler)
  Bundler.require(*Rails.groups(assets: %w[ development test ]))
end

module GithubStatusBoard
  class Application < Rails::Application
    config.active_record.whitelist_attributes          = true
    config.active_support.escape_html_entities_in_json = true
    config.assets.enabled                              = true
    config.assets.initialize_on_precompile             = false
    config.assets.precompile                          += %w[ rails_admin/rails_admin.css rails_admin/rails_admin.js ]
    config.assets.version                              = '1.0'
    config.encoding                                    = 'utf-8'
    config.filter_parameters                          += [:password]
    config.i18n.default_locale                         = :en
    config.sass.preferred_syntax                       = :sass
    config.time_zone                                   = 'Arizona'
  end
end
