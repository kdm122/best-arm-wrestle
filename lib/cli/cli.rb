class Cli

    def run
        intro
        Api.search("death") # have to come up with a search a bit later, hardcoding for the time being
        main
    end

    def intro
        puts "Select Your Champions"
    end

    def main
        print_all
    end

    def print_all
        Champion.all.each {|c| puts "#{c.id}) #{c.name}" }
    end

end
