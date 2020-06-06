#require 'dotenv/load' # BYYYYYE
 
class Api
  # attr_accessor :url # remnant of some of the original tests

  KEY = ENV['SUPER_KEY']
  BASE_URL = 'https://www.superheroapi.com/api.php/'
  
  def self.base  #Just give us some base results.
    res = RestClient.get("#{BASE_URL}#{KEY}/search/death")
    data = JSON.parse(res.body)
    data['results'].each do |champ|
      name = champ['name']
      id = champ['id']
      Champion.new(id, name)
    end

  end


  def self.search(name)  #search results.
    res = RestClient.get("#{BASE_URL}#{KEY}/search/#{name}")
    data = JSON.parse(res.body)
    data['results'].each do |champ|
      name = champ['name']
      id = champ['id']
      Champion.new(id, name)
    end

  end

  def self.cdet_by_name(name)
    res = RestClient.get("#{BASE_URL}#{KEY}/search/#{name}")
    data = JSON.parse(res.body)
    data['results'].each do |champ|
      name = champ['name']
      id = champ['id']
      Champion.new(id, name)
    end
  end
  

end
