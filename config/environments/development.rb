Enchant::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
end

ENV['CHUTE_APP_ID'] = '5227a8a26e29313db9000165'
ENV['CHUTE_ACCESS_KEY'] = '98d95c4e1c349ba369ee2231d544cade9ee40a9e0f610fb6ccc08af969204b49'

# to generate a new id, run: Chute::V2::Albums.create({:name => 'Nike Enchant' })
ENV['CHUTE_ALBUM_ID'] = '2483568'
