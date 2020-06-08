# best-arm-wrestle
Learn.co CLI API Project

This is an initial commit to the repo.  As of right now, I want to see which superheroes would win when arm wrestling.  

Project Relevant:

API Key Issuance and API Documentation:  https://superheroapi.com/  An API key is freely available when authenticating with your Facebook account.

Setup .env with the following:

SUPER_KEY='xxxxxxxxxxxxxxx'

Instructions:

The Superhero CLI takes some seeded superheroes and allows you to get additional information about them, as well put them into simulated battle.  

Application can be run using bin/run

The following main menu commands are available:

participants (shows existing character data within the application)
more info (shows additional information about the existing character set)
search (allows a user to search for additional characters and add them to the pool)
simulate (see who's going to win in an arm wrestle)
exit

Contributors:

Feel free to contribute code by messaging me directly on Github.

Licenses:

All code is available for use under GNU Licensing.

Project Irrelevant:

05/30/20, Mayor's log.  We'll officially consider this day 1, day 0 being my creation of the project.  Nearly a week behind in starting the project, I've finally moved from the unreliable web-based IDE to a dedicated IDE.  Fancy, right?  I'm continuing to have issues with incompatable filesystems, but whatever, I'll figure that out later.  My goal in this project is to compare two otherwise unrelated superheroes and see which would win in an arm wrestling compettion.  The stated goal of this CLI project is otherwise, so I'll fill in the gaps with providing subsequent information so that I can get a passing grade.  We'll see how this initial vision goal compares to what's presented at the end of the project.  Today was a good day, I was able to hack together a previous lesson's json parse method to be able to determine that there are 2 worthwhile Howards within all superhero codex (or at least the one I'm using).  Whatever, Howard the Duck is the only real Howard that matters, we can all agree on that, right?  Need to research best methods for API key obfuscation, in the mean time, the code functions with a howard = GetRequester.new(api_key); howard.parse_json.  

06/05/20, Mayor's log.  It's been a minute.  Only 13 minutes remaining in the day.  Going to start by setting up my API key within the .env and go from there.

06/07/20, Mayor's log.  I actually accomplished quite a bit during my last session.  I'm understanding the importance of personal documentation.  I'm just now resuming where I left off, and trying to situate where I actually left off.  I'm feeling confident about reaching the MVP shortly.  Ideally I'll be able to introduce some of the more advanced functionality that I was hoping to bring to the CLI.

06/08/20, Mayor's log.  Early on the 8th.  We are now querying against the API, with some seeding of data (sorry, the API apparently won't let me just fetch a list of results), pulling the characters as Class instances, allowing the addition of new characters, and finally...  the arm wrestle.  