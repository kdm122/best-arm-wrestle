class Champion
    attr_accessor :id, :name, :powerstats, :appearance

    @@all = []

    def initialize(id, name, powerstats, appearance)
        @id = id
        @name = name
        @powerstats = powerstats # going to try and throw these into an array, rather than individual items.
        @appearance = appearance # Adding another layer.  Forgot about the fact that the CLI needs to return an additiona layer of data.
        @@all << self

    end

    def self.all
        @@all
    end

    def self.cdet_by_name(name)
    #    binding.pry
            champion = Champion.all.find { |c| c.name == name }
            # binding.pry
                puts "#{champion.name} is #{champion.appearance['race']}, #{champion.appearance['height'][0]} and #{champion.appearance['weight'][0]}" #forcing selection because we don't use the metric system
                puts ""
                champion.powerstats.each do |stat|
                   puts "#{stat[0].capitalize}: #{stat[1]}"
                end
                
                
             #   puts "Intelligence: " # Got rid of this so that we're iterating rather than hardcoding.

    
        #res = RestClient.get("#{BASE_URL}#{KEY}/#{id}")
        #data = JSON.parse(res.body)
        #data['results'].each do |champ|
        #  name = champ['name']
        #  id = champ['id']
        #  Champion.new(id, name)
        #end
    end

    def self.arm_wrestle(champ1, champ2) # welp, gotta do something at some point with this arm wrestle
        #gonna start this out extra sloppy
        

        champion1 = Champion.all.find { |c| c.name == champ1 }
        champion2 = Champion.all.find { |c| c.name == champ2 }

        puts "#{champion1.name} vs #{champion2.name}"
        sleep 1.0
        puts ""
        puts "MORTAL KOMBAT!"
        # binding.pry
      #  binding.pry
        if champion1.powerstats['strength'].to_i > champion2.powerstats['strength'].to_i # fixed a bad comparison
            puts "#{champion1.name} was victorious. #{champion2.name} plots their revenge for another day."
        else
            puts "#{champion2.name} was victorious. #{champion1.name} plots their revenge for another day."
        end

        puts ""  # If I have time, I'm going to write a function for space(arg)
        puts ""


    end


end
