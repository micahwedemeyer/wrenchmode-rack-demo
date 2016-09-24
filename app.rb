require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

environment = settings.environment || 'development'
require "./config-#{environment}"

wm_config = {
  check_delay_secs: 2,
  logging: true
}

# In production, we assume it's being handled via the Heroku Addon
if environment == 'development' || !ENV['HEROKU_INSTALL']
  wm_config[:jwt] = WRENCHMODE_JWT
  wm_config[:status_protocol] = WRENCHMODE_STATUS_PROTOCOL
  wm_config[:status_host] = WRENCHMODE_STATUS_HOST
end

use Wrenchmode::Rack, wm_config

get "/" do
  slim :index
end

get "/app.css" do
  scss "sass/app".to_sym
end
