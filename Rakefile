require 'sinatra/activerecord' 
require './config/environment' 
require 'sinatra/activerecord/rake' 
require './server'
require 'ddtrace'
require 'ddtrace/contrib/sinatra/tracer'

configure do
   settings.datadog_tracer.configure default_service: 'fake_trout_test', debug: true, enabled: true 
end
