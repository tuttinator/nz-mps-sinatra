require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :scraper)
DB = Sequel.connect(ENV['DATABASE_URL'])

require 'models/mp'

