DB = Sequel.connect(ENV['DATABASE_URL'])

class MP < Sequel::Model
  BASE_URL = 'http://www.parliament.nz'

  def self.parse(name, link, electorate_details, image)
    last_name, first_name = name.split(',').map(&:strip)
    electorate, party, list_mp = parse_electorate(electorate_details)
    new(details_url: link,
        first_name: first_name,
        last_name: last_name,
        party: party,
        electorate: electorate,
        list_mp: list_mp,
        details_url: BASE_URL + link,
        image_url: BASE_URL + link
       )
  end

  def self.parse_electorate(electorate_details)
    party, electorate = electorate_details.split(',').map(&:strip)
    if electorate == 'List'
      [nil, party, true]
    else
      [electorate, party, false]
    end
  end

  def as_json
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      party: party,
      electorate: electorate,
      list_mp: list_mp,
      details_url: details_url,
      image_url: image_url
    }
  end

  private

  def image_from_src(src)
    BASE_URL + src
  end
end
