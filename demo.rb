require 'sinatra'
require './redirector'

use Redirector

get "/" do
  '200 Hello World'
end