#require 'dotenv/load' # BYYYYYE
 
class Api
  # attr_accessor :url # remnant of some of the original tests

  KEY = ENV['SUPER_KEY']
  BASE_URL = 'https://www.superheroapi.com/api.php/'
  
  def self.base  
  rng = [69, 644, 655, 530, 391]
    rng.map do |random|
      
      res = RestClient.get("#{BASE_URL}#{KEY}/#{random}") #hardcoded just so we can see some results populate, we're going to get rid of that by working more on the search by name.
       data = JSON.parse(res.body)
    end
  end


  def self.search_by_name(name)  #search results.
    name_space = name.split(' ').join('%20')
    res = RestClient.get("#{BASE_URL}#{KEY}/search/#{name_space}")
    data = JSON.parse(res.body)
    
    if name == "Kyle"
      Champion.new(0, "Kyle", {"intelligence"=>"1000", "strength"=>"1000", "speed"=>"1000", "durability"=>"1000", "power"=>"1000", "combat"=>"1000"}, {"gender"=>"Male", "race"=>"Human", "height"=>["5'9", "178 cm"], "weight"=>["170 lb", "77 kg"], "eye-color"=>"Blue", "hair-color"=>"Blonde"})
    puts ""
    puts ""
    puts "SECRET CHARACTER UNLOCKED"
    puts ""
    puts ""

     
   
    elsif data['response'] == "error"
      puts "Bad Search, not in our Superhero Database"
    elsif Champion.all.any? {|c| name == c.name }
      puts "Already in our pool.  You're not going to trick me into querying the API again." # can't touch it twice for the same thing
    else
      data['results'].take(1).each do |champ| # I'm sure I can figure out a better way but this is letting us add Batman to the tournament.  Previous attempts at specificity were causing first person instances without exact matches to be declined.  No Batman... but batman II?
      name = champ['name']
      id = champ['id']
      powerstats = champ['powerstats']
      appearance = champ['appearance']
      Champion.new(id, name, powerstats, appearance)
      puts ""
      puts ""
      puts "A NEW CHALLENGER APPEARS!  #{name} has been added to our participant pool."
      end
    end

  end

end
