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
                puts "#{champion.name} is #{champion.appearance}"


    
        #res = RestClient.get("#{BASE_URL}#{KEY}/#{id}")
        #data = JSON.parse(res.body)
        #data['results'].each do |champ|
        #  name = champ['name']
        #  id = champ['id']
        #  Champion.new(id, name)
        #end
    end


end
