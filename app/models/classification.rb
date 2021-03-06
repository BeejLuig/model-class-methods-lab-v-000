class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    all
  end

  def self.longest
    longest = Boat.select(:id).order("length DESC").limit(1)[0] 
    joins(:boat_classifications).where("boat_id = ?", longest)
  end
end
