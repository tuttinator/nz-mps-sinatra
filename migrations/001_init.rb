require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'])

DB.create_table :mps do
  primary_key :id
  varchar :first_name
  varchar :last_name
  varchar :party
  varchar :electorate
  boolean :list_mp
  varchar :details_url
  varchar :image_url
end
