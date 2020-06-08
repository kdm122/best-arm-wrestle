class Cli

    def initialize
        Api.base
    end

    def launch
        binding.pry
        input = ""
        while input != "exit"
          puts "Superhero Tournament Organizer 1.0"
          puts "To view all presently available participants type 'participants'."
          puts "To get more information on a participant type 'more info'"
          puts "To simulate the fight, type 'simulate'"
          puts "What would you like to do?"
          input = gets.strip
    #      binding.pry
          case input
          when "participants"  ## spent 5 minutes trying to debug why participants was not recognizing...  it was partypants.
            print_all
            print_tail
          when "more info"
            print_selection_prompt
            name = selection_prompt
            valid_name_info?(name)
          when "simulate"  #this is where I'll actually initiate the fight
          
          end
    
        end
      
    end
    

    def run
        print_intro
    #    Api.base # Switched to some base results
        main
    end

    def main
        print_all
        print_selection_prompt
        name = selection_prompt
    #   binding.pry
        valid_name?(name)
    end

    def valid_name_info?(name)  #switching up to separate a valid information request and a valid add participant.  I know it's gross, will refactor later
       # id = id.to_i
       if Champion.all.any? {|c| name == c.name }
            true
            print_more_info(name)
            print_tail
        else
            print_bad_name
            sleep 2.0
            main
        end

    end

    def champion_details(name)
        Champion.cdet_by_name(name)
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

    def print_more_info(name)
        puts "Info on #{name}"
        Champion.cdet_by_name(name)
    end

    def print_add_to_fight
        puts "Would you like to add them to the match?"
    end

    def print_bad_name
        puts "Poor selection, try again"
    end

    def selection_prompt
        gets.chomp
    end

    def search_prompt
        gets.chomp
    end

    def print_tail
        puts ""
        puts ""
    end



end
