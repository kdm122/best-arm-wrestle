class Champion
    attr_accessor :id, :name, :int, :str, :spd, :dur, :pow, :comb

    @@all = []
    def initialize(id, name)
        @id = id
        @name = name
        @int = int
        @str = str
        @spd = spd
        @dur = pow
        @comb = comb
        @@all << self

    end

    def self.all
        @@all
    end



end
