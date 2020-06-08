#require 'dotenv/load' # BYYYYYE
 
class Api
  # attr_accessor :url # remnant of some of the original tests

  KEY = ENV['SUPER_KEY']
  BASE_URL = 'https://www.superheroapi.com/api.php/'
  
  def self.base  #Just give us some base results.
    res = RestClient.get("#{BASE_URL}#{KEY}/search/death") #hardcoded just so we can see some results populate, we're going to get rid of that by working more on the search by name.
#    binding.pry # inserting this here because I'm about to start checking into RestClient response codes.  Need to be able to handle failed seearches.    
    data = JSON.parse(res.body)
#    data["response"] # checking if this was error/success
#binding.pry
    data['results'].each do |champ|
      name = champ['name']
      id = champ['id']
      powerstats = champ['powerstats']
      appearance = champ['appearance']
#      binding.pry
      Champion.new(id, name, powerstats, appearance)
    end
#    binding.pry # going to try out our details
  end


  def self.search_by_name(name)  #search results.
    name_space = name.split(' ').join('%20')
    res = RestClient.get("#{BASE_URL}#{KEY}/search/#{name_space}")
    data = JSON.parse(res.body)
    if data['results'].count > 1
      puts "Too many results.  Select with more specificity from the following:"
      data['results'].each do |champ|
        puts "#{champ['name']}"
      end
      
    else
      data['results'].each do |champ| # leftover junk
      name = champ['name']
      id = champ['id']
      powerstats = champ['powerstats']
      appearance = champ['appearance']
      Champion.new(id, name, powerstats, appearance)
      end
    end

  end

  #

  

end
