class Staff < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  def to_s
    return first_name + " " + last_name
  end	
end
