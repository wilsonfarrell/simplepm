class RoleType < ActiveRecord::Base
  attr_accessible :description, :name 
  def to_s
    return name
  end
end
