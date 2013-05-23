class User < ActiveRecord::Base
  # validates :skill_id, :uniqueness => true
  # Remember to create a migration!
  has_and_belongs_to_many :skills

end
