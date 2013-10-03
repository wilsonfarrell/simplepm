class PlanningTime < ActiveRecord::Base
  belongs_to :project_role
  attr_accessible :project_role_id, :end_date, :start_date, :time_pct
  validates :time_pct, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1}

  class << self
    
    def add_range(project_role, begin_date,end_date,percentage)
      ranges = project_role.planning_times.find(:all,:order => "begin_date");
      ranges.each do pt 
        
      end
    end
end
