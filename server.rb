require 'sinatra'
require 'sinatra/activerecord'
require './config/environment'
current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }
require 'datadog/statsd'
require 'byebug'

module Sinatra
  class Server < Sinatra::Base
    
    statsd = Datadog::Statsd.new('datadog_test.pet-tinder.com', 5000)

    get "/" do
      @trouts = Trout.all
      erb :index
      statsd.gauge('users.online', 123, :sample_rate=>0.5)
    end

    get "/:id" do
      @trout = Trout.find(params[:id])
      erb :index
      # statsd.increment('page.views')
    end
  end
end
