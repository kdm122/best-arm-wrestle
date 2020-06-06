#require 'dotenv/load' # BYYYYYE


 

class Api
  attr_accessor :url

  KEY = ENV['SUPER_KEY']

  def initialize(search_term)

    @url = "https://www.superheroapi.com/api.php/#{KEY}/search/#{search_term}" # they want commented code.  Switched up the argument since this is no longer a multiple purpose method.  This is going to be 100% for searching superheroes.  Rather than taking an json link as an argument, I'm instead forcing it to my desired API, with the argument now being the API key.
    puts @url

  end

  def get_response_body
    uri = URI.parse(@url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parse_json
    parsed_json = JSON.parse(self.get_response_body)
    parsed_json
  end



end

howard = Api.new('howard')
print howard.parse_json