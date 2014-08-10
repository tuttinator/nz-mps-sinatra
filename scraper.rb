current_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(current_dir) unless $LOAD_PATH.include? current_dir

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :scraper)

require 'models/mp'

require 'capybara/dsl'
require 'capybara/mechanize'

MP_LIST_URL = 'http://www.parliament.nz/en-nz/mpp/mps/current?Criteria.ViewAll=1'

module Parliament
  BASE_URL = 'http://www.parliament.nz'
  class MPScraper
    def initialize
      Capybara.current_driver = :mechanize
      Capybara.run_server = false
      Capybara.app_host = BASE_URL
    end
  end
end
