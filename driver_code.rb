# Require config/environment.rb. This loads app/models, etc.
require ::File.expand_path('../config/environment',  __FILE__)


### TEST HELPERS ###
def clean_up_data
  # Clean up data between tests to prevent cross talk
  User.destroy_all
  Skill.destroy_all
end






# DO NOT CHANGE BELOW THIS LINE. FEEL FREE TO WRITE MORE DRIVER CODE ABOVE
puts "**** CORE ****"
clean_up_data

zee = User.create({:name => "Zee", :email => "zee@example.com", :password => "password"})
beard_growing = Skill.create({:name => "Beard Growing", :context => "personal"})


### This confirms you may add a Skill to a User 
zee.skills << beard_growing
puts "#{Skill.find_by_name('Beard Growing').users.include?(zee)} Zee has the beard growing skill!"


### This confirms a User may have many skills
programming = Skill.create({:name => "Programming", :context => "technical"})
zee.skills << programming
puts Skill.find_by_name("Programming").users.include?(zee) + "Zee can Programm!!!!!!"

### This confirms that skills can have many users
jesse = User.create({:name => "Jesse", :email => "jesse@example.com", :password => "password"})
beard_growing.users << jesse
puts Skill.find_by_name("Beard Growing").users.include?(jesse) + "Jesse has the beard growing skill!"

### This confirms that skills cannot have the same name
beard_growing2 = Skill.create({:name => "Beard Growing", :context => "personal"})
puts !beard_growing2.persisted? + "Second Beard Growing Skill is not saved"


### This confirms that adding the same skill mutliple times neither saves the
### relationship to the database, nor raises an exception
zee.skills << beard_growing
puts zee.skills.size == 1 + "Zee only has beard growing as a skill once!"


# puts "**** STRETCH ****"
# clean_up_data

# zee = User.create({:name => "Zee", :email => "zee@example.com", :password => "password"})
# programming = Skill.create({:name => "Programming", :context => "Professional"})

# zees_programming_proficiency = Proficiency.create({:person => zee, :skill => programming, :years_experience => 90, :formal_training => false})

# ### This confirms the proficiency saved for Zee successfully
# Proficiency.first({ :skill => programming, :user => zee).years_experience.eql?(90) + "Zee has been programming for a while!"
# !zee.proficiencies.find_by_skill(programming).formal_training? + "Zee hasn't been trained formally!"

### Write your own driver code which validates Proficiencies must include
### skill, person, years experience and formal training


