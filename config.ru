require 'sinatra/activerecord'
require "sinatra"
require "sinatra/reloader"
require_relative "server"
run Sinatra::Application
