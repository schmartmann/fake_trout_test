# require 'sinatra/base'
require 'ddtrace'
require 'ddtrace/contrib/sinatra/tracer'
# require 'sinatra/activerecord'
require './config/environment'
current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

# module Sinatra
  # class Server < Sinatra::Base
  class Sinatra::Application
    
    get "/" do
      @trouts = Trout.all
      erb :index
    end

    get "/:id" do
      @trout = Trout.find(params[:id])
      erb :index
    end

  end
# end
