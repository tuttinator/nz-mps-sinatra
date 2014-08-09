require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :web)
DB = Sequel.connect(ENV['DATABASE_URL'])

require 'models/mp'

class NZMPListApp < Sinatra::Base

  set :root, NZMPListApp.root

  get '/mps' do
    # render all the MPs as JSON
  end
end
