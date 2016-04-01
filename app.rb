require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

environment = settings.environment || 'development'
require "./config-#{environment}"

use Wrenchmode::Rack,
  check_delay_secs: 2,
  logging: true,
  jwt: WRENCHMODE_JWT,
  status_protocol: WRENCHMODE_STATUS_PROTOCOL,
  status_host: WRENCHMODE_STATUS_HOST

get "/" do
  slim :index
end

get "/app.css" do
  scss "sass/app".to_sym
end
