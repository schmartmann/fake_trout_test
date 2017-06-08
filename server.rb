require 'sinatra'
require 'sinatra/activerecord'
require './config/environment'
current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }
require 'byebug'
require 'ddtrace'
require 'ddtrace/contrib/sinatra/tracer'

module Sinatra
  class Server < Sinatra::Base
    
    get "/" do
      @trouts = Trout.all
      erb :index
    end

    get "/:id" do
      @trout = Trout.find(params[:id])
      erb :index
    end

  end
end
