# best-arm-wrestle
Learn.co CLI API Project

This is an initial commit to the repo.  As of right now, I want to see which superheroes would win when arm wrestling.  

Project Relevant:

API Key Issuance and API Documentation:  https://superheroapi.com/


Project Irrelevant:

05/30/20, Mayor's log.  We'll officially consider this day 1, day 0 being my creation of the project.  Nearly a week behind in starting the project, I've finally moved from the unreliable web-based IDE to a dedicated IDE.  Fancy, right?  I'm continuing to have issues with incompatable filesystems, but whatever, I'll figure that out later.  My goal in this project is to compare two otherwise unrelated superheroes and see which would win in an arm wrestling compettion.  The stated goal of this CLI project is otherwise, so I'll fill in the gaps with providing subsequent information so that I can get a passing grade.  We'll see how this initial vision goal compares to what's presented at the end of the project.  Today was a good day, I was able to hack together a previous lesson's json parse method to be able to determine that there are 2 worthwhile Howards within all superhero codex (or at least the one I'm using).  Whatever, Howard the Duck is the only real Howard that matters, we can all agree on that, right?  Need to research best methods for API key obfuscation, in the mean time, the code functions with a howard = GetRequester.new(api_key); howard.parse_json.  