class Cli

    def run
        print_intro
        Api.base # Switched to some base results
        main
    end

    def main
        print_all
        print_selection_prompt
        name = selection_prompt
    #   binding.pry
        valid_name?(name)
    end

    def valid_name?(name)  #trying to switch validation to name
       # id = id.to_i
       if Champion.all.any? {|c| name == c.name }
            true
        else
            print_bad_name
            sleep 2.0
            main
        end

    end
    
    def print_intro
        puts "Available Champions"
    end

    def print_search
        puts "Search Available Champions"
    end

    def print_all
        Champion.all.each {|c| puts "#{c.id}) #{c.name}" }
    end

    def print_selection_prompt
        puts "Select a Champion by Name"
    end

    def print_bad_name
        puts "Poor selection, try again"
    end

    def selection_prompt
        gets.chomp
    end


end
