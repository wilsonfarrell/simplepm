class Project < ActiveRecord::Base
  has_many :project_roles
  attr_accessible :description, :name
  
  def to_s
    return name
  end
end
