class Champion
    attr_accessor :id, :name, :powerstats

    @@all = []

    def initialize(id, name, powerstats)
        @id = id
        @name = name
        @powerstats = powerstats # going to try and throw these into an array, rather than individual items.
      
        @@all << self

    end

    def self.all
        @@all
    end



end
