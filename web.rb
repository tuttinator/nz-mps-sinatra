current_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(current_dir) unless $LOAD_PATH.include? current_dir
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :web)

require 'json'

require 'models/mp'

class NZMPListApp < Sinatra::Base

  set :root, NZMPListApp.root

  get '/parliament/current/mps' do
    content_type :json
    mps = MP.all.map(&:as_json)
    JSON.generate mps
  end

  get '/parliament/current/mps/:id' do
    content_type :json
    mp = MP[params[:id].to_i].as_json
    JSON.generate mp
  end
end
