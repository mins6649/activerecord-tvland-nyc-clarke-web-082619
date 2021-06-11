class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    fullname = []
    fullname << self.first_name
    fullname << self.last_name
    fullname.join(' ')
  end

  def list_roles
    characters.collect do |character|
        "#{character.name} - #{character.show.name}"
    end
  end
end
