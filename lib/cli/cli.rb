class Cli

    def initialize
        Api.base
    end

    def launch
        input = ""
        while input != "exit"
          puts "Superhero Arm Wrestling Tournament Organizer 1.0"
          puts "To view all presently available participants type 'participants'"
          puts "To search the Superhero database and add new particpants type 'search'"
          puts "To get more information on a participant type 'more info'"
          puts "To simulate the fight, type 'simulate'"
          puts "What would you like to do?"
          input = gets.strip
          case input
          when "participants"  ## spent 5 minutes trying to debug why participants was not recognizing...  it was partypants.
            print_all
            print_tail
          when "more info"
            print_selection_prompt
            name = selection_prompt
            if valid_name_info?(name)
                print_more_info(name)
            end
            print_tail
          when "simulate"  #this is where I'll actually initiate the fight
            print_simulate_prompt
            champ = selection_prompt.split(" vs ")
            valid_name_info?(champ[0])
            valid_name_info?(champ[1])
            Champion.arm_wrestle(champ[0], champ[1])
            print_tail
          when "search"
            print_search
            name = selection_prompt
            Api.search_by_name(name)
            print_tail
          end
    
        end
      
    end

    def valid_name_info?(name)  #switching up to separate a valid information request and a valid add participant.  I know it's gross, will refactor later
       # id = id.to_i
       if Champion.all.any? {|c| name == c.name }
            true
        else
            print_bad_name(name)
            sleep 1.0
            launch
        end

    end

    def print_all
        puts "Presently available Champions:"
        Champion.all.each {|c| puts "#{c.name}" }
    end

    def print_selection_prompt
        puts "Select a Champion by Name (Case Sensitive)"
    end

    def print_simulate_prompt
        puts "Set your battle."
        puts "Provide the name of two Champions with the following syntax:"
        puts "Example:  'Batman vs Kingpin' (Must be part of participant pool, names are case sensitive)"
    end

    def print_more_info(name)
        puts "Info on #{name}"
        Champion.cdet_by_name(name)
    end

    def print_search
        puts "Search for a Champion, they will automatically be added to the pool (Try Gambit, Deadpool, etc)"  # switching out the recommendation for superman.  Apparently that pulls Cyborg superman with some nil data.  Not sure I'll get around to nil data checking.
    end

    def print_bad_name(name)
        puts "Poor selection, try again. #{name} is not a valid Champion."
    end

    def selection_prompt
        gets.chomp
    end

    def print_tail ##because spacing looks weird
        puts ""
        puts ""
    end



end
