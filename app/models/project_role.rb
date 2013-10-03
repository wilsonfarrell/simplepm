class ProjectRole < ActiveRecord::Base
  belongs_to :project
  belongs_to :staff
  belongs_to :role_type

  attr_accessible :project_id, :staff_id, :role_type_id

  def to_s
    return project.to_s + " with " + staff.to_s + " as " + role_type.to_s
  end
end
