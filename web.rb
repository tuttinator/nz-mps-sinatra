require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :web)
require './config/database'

class NZMPListApp < Sinatra::Base

  set :root, NZMPListApp.root

  get '/mps' do
    # render all the MPs as JSON
  end
end
