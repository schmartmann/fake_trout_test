require 'sinatra/activerecord'
require "sinatra/base"
# require "sinatra/reloader"
require_relative "server"
run Sinatra::Server

# configure do
#    settings.datadog_tracer.configure default_service: 'fake_trout_test', debug: true
# end
