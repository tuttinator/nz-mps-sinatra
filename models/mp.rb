DB = Sequel.connect(ENV['DATABASE_URL'])

class MP < Sequel::Model
  def as_json
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      party: party,
      list_mp: list_mp,
      details_url: details_url,
      image_url: image_url
    }
  end

  private

  def image_from_src(src)
    BASE_URL + src
  end

  def parse_electorate(electorate_name)
    if electorate_name == 'List'
      electorate = nil
      list_mp = true
    end
  end
end
