unless defined? DATABASE_URL
  require 'dotenv'
  Dotenv.load
end

require './scraper'

desc 'Scrapes the list of MPs from parliament.nz'
task :scrape do
  Parliament::MPScraper.new.call
end
