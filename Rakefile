desc 'Scrapes the list of MPs from parliament.nz'
task :scrape do
  require './scraper'
  unless defined? DATABASE_URL
    require 'dotenv'
    Dotenv.load
  end
  Parliament::MPScraper.new.call
end
