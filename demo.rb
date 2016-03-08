require 'sinatra'
require 'slim'
require 'sass'

require './redirector'

use Redirector

get "/" do
  slim :index
end

get "/app.css" do
  scss "sass/app".to_sym
end

