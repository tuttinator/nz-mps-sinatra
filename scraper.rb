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
    include Capybara::DSL

    attr_reader :mps

    def initialize
      Capybara.current_driver = :mechanize
      Capybara.run_server = false
      Capybara.app_host = BASE_URL
      Capybara.app = true
      @mps = []
    end

    def call
      MP.db.transaction do
        MP.truncate
        scrape!
        @mps.each(&:save)
      end
    end

    def scrape!
      puts 'Fetching main list'
      visit '/en-nz/mpp/mps/current?Criteria.ViewAll=1'
      table_rows = all('table.listing tbody tr')
      table_rows.each do |tr|
        cells = tr.all('td')
        name = cells.first.text
        link = cells.first.find('a')[:href]
        electorate_details = cells.last.text
        construct_record(name, link, electorate_details)
      end
    end

    def construct_record(name, link, electorate_details)
      puts "Visiting #{link}"
      visit link
      image = begin
                find('td.image img')[:src]
              rescue Capybara::ElementNotFound
                puts "#{name} does not have a photo"
              end
      @mps << MP.parse(name, link, electorate_details, image)
    end
  end
end
