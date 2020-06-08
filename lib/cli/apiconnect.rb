#require 'dotenv/load' # BYYYYYE
 
class Api
  # attr_accessor :url # remnant of some of the original tests

  KEY = ENV['SUPER_KEY']
  BASE_URL = 'https://www.superheroapi.com/api.php/'
  
  def self.base  #Just give us some base results.
    ## time to get rid of these static fighters.  Let's try and insert an RNG

    rng = 5.times.map { rand(1..100) }
  #  binding.pry
    rng.each do |random|
      
      res = RestClient.get("#{BASE_URL}#{KEY}/#{random}") #hardcoded just so we can see some results populate, we're going to get rid of that by working more on the search by name.
   #   binding.pry
      #    binding.pry # inserting this here because I'm about to start checking into RestClient response codes.  Need to be able to handle failed seearches.    
      data = JSON.parse(res.body)
  #    data["response"] # checking if this was error/success
  #binding.pry
   #   data['results'].each do |champ| # can eliminate this now that I'm not seeding with a bunch of data and instead, individual pulls
        name = data['name']
        id = data['id']
        powerstats = data['powerstats']
        appearance = data['appearance']
  #      binding.pry
        Champion.new(id, name, powerstats, appearance)
     # end
    end
#    binding.pry # going to try out our details
  end


  def self.search_by_name(name)  #search results.
    name_space = name.split(' ').join('%20')
    res = RestClient.get("#{BASE_URL}#{KEY}/search/#{name_space}")
    data = JSON.parse(res.body)
    #if data['results'].count > 1
    #  binding.pry
    #  puts "Too many results.  Select with more specificity from the following:"
    #  data['results'].each do |champ|
    #    puts "#{champ['name']}"
    #  end
    #  
    #else
    if data['response'] == "error"
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

  #

  

end
