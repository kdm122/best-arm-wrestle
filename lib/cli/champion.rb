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
        
        champion = find_by_name(name)
        champion.details
    
    #    champion = Champion.all.find { |c| c.name == name }
    #            puts "#{champion.name} is #{champion.appearance['race']}, #{champion.appearance['height'][0]} and #{champion.appearance['weight'][0]}" #forcing selection because we don't use the metric system
    #            puts ""
    #            champion.powerstats.each do |stat|
    #               puts "#{stat[0].capitalize}: #{stat[1]}"
    #            end
    
    end

    def self.create_batch(data_array)
        data_array.each do |data|
            name = data['name']
            id = data['id']
            powerstats = data['powerstats']
            appearance = data['appearance']
            new(id, name, powerstats, appearance)
        end
    end

    def details

        deets = "#{name} is #{appearance['race']}, #{appearance['height'][0]} and #{appearance['weight'][0]}" #forcing selection because we don't use the metric system
        powerstats.each do |stat|
           deets += "\n#{stat[0].capitalize}: #{stat[1]}"
        end

        deets
    end


    def self.find_by_name(name)

        all.find { |c| c.name == name }

    end


    def self.arm_wrestle(champ1, champ2) # welp, gotta do something at some point with this arm wrestle
        #gonna start this out extra sloppy
        

        champion1 = find_by_name(champ1)
        champion2 = find_by_name(champ2)
        sleep 1.0
        puts ""
        puts "#{champion1.name} vs #{champion2.name}"
        sleep 1.0
        puts ""
    
        if champion1.powerstats['strength'].to_i > champion2.powerstats['strength'].to_i # fixed a bad comparison
            puts "#{champion1.name} was victorious. #{champion2.name} plots their revenge for another day."
        else
            puts "#{champion2.name} was victorious. #{champion1.name} plots their revenge for another day."
        end

        puts ""  # If I have time, I'm going to write a function for space(arg)
        puts ""


    end


end
