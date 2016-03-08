require 'sinatra'
require 'slim'
require 'sass'

require './redirector'

use Redirector, domain_id: 4, logging: true

get "/" do
  slim :index
end

get "/app.css" do
  scss "sass/app".to_sym
end

