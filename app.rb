require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

use Wrenchmode::Rack, check_delay_secs: 2, logging: true, jwt: "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJEb21haW46MTIiLCJleHAiOjE0NjA2NTY4NzcsImlhdCI6MTQ1ODA2NDg3NywiaXNzIjoiQ3Jhc2hzd2l0Y2giLCJqdGkiOiI3MDIwNTFlOS0wZmNmLTRlZGYtODRlMS0zMWZjMTEzOTg4Y2EiLCJwZW0iOnt9LCJzdWIiOiJEb21haW46MTIiLCJ0eXAiOiJ0b2tlbiJ9.Y90a7cDw_-1qMVW-hMjCR4EZWP8yOhTNrUb4ThPKAa4HsdD7S_z1eGhRrwd3uobIOKnftmYF1TjiHP3WVzlYCA"

get "/" do
  slim :index
end

get "/app.css" do
  scss "sass/app".to_sym
end

