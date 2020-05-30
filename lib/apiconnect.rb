require 'net/http'
require 'open-uri'
require 'json'


class GetRequester
  attr_accessor :url


  def initialize(api_key)
    @url = "https://www.superheroapi.com/api.php/#{api_key}/search/howard"


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