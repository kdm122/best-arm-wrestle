class Cli

    def run
        intro
        Api.search("death") # have to come up with a search a bit later, hardcoding for the time being
        main
    end

    def intro
        puts "Available Champions"
    end

    def main
        print_all
        print_selection_prompt
        name = selection_prompt
       binding.pry
    end

    def valid_name?(name)  #trying to switch validation to name
       # id = id.to_i
       if Champion.all.any? {|c| name == c.name }
            true
        else
            false
        end

    end
    

    def print_all
        Champion.all.each {|c| puts "#{c.id}) #{c.name}" }
    end

    def print_selection_prompt
        puts "Select a Champion by Name"
    end

    def selection_prompt
        gets.chomp
    end


end
