current_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(current_dir) unless $LOAD_PATH.include? current_dir
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :web)

require 'models/mp'

class NZMPListApp < Sinatra::Base

  set :root, NZMPListApp.root

  get '/mps' do
    # render all the MPs as JSON
  end
end
