
desc 'Scrapes the list of MPs from parliament.nz'
task :scrape do
  if ENV['DATABASE_URL'].nil?
    require 'dotenv'
    Dotenv.load
  end
  require './scraper'
  Parliament::MPScraper.new.call
end
