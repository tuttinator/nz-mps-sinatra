DB = Sequel.connect(ENV['DATABASE_URL'])

class MP < Sequel::Model
end
