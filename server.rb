require 'sinatra/reloader'
require 'ddtrace'
require 'ddtrace/contrib/sinatra/tracer'
require './config/environment'
current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class Sinatra::Application
  
  configure do
    settings.datadog_tracer.configure default_service: "troutapp", debug:true, enabled:true,
      trace_agent_port:8126 
  end
  
  configure :development do 
    register Sinatra::Reloader
  end

  get "/" do
    @trouts = Trout.all
    erb :index
  end

  get "/:id" do
    @trout = Trout.find(params[:id])
    erb :index
  end

end
