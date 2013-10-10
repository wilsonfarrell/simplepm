class PlanningTime < ActiveRecord::Base
  belongs_to :project_role
  attr_accessible :project_role_id, :end_date, :start_date, :time_pct
  validates :time_pct, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1}

  class << self
    
    def add_range(new_range)
      
      overlapped = false
      done = false
      bring_forward = nil
      destroy_list = Array.new()
      new_range.project_role.planning_times.find(:all,:order => "begin_date").each do pt 
        if !done
          # does this time range overlap or abutt the argument times
          if new_range.begin_date <= pt.end_date + 1.days && new_range.end_date >= pt.start_date - 1.days
            
            # Find the first record that overlaps
            if !overlapped
              overlapped = true
              
              # if it is the same percentage
              # modify this record to contain the time range
              if pt.time_pct == new_range.time_pct
                if pt.start_date > new_range.start_date
                  pt.start_date = new_range.start_date
                end
                if pt.end_date < new_range.end_date
                  pt.end_date = new_range.end_date
                else
                  done = true
                end
                pt.save
                bring_forward = pt
              else # not the same percentage
                # does the new range totally overlap this range
                # if so, just update the old with the new range and percentage
                if pt.start_date >= start_date && pt.end_date <= end_date
                  
                  pt.time_pct = time_pct
                  pt.start_date = start_date
                  if pt.end_date == end_date
                    done = true
                  else
                    pt.end_date = end_date
                  end
                  pt.save
                  bring_forward = pt
                elsif pt.start_date > start_date # overlaps the head
                  # create a new range and change the start of the existing range
                  if (time_pct >= 0.0) 
                    project_role.planning_times.create({:begin_date => begin_date, :end_date => end_date, :time_pct => time_pct})
                  end
                  pt.start_date = end_date + 1.days
                  done = true
                else  # overlaps the tail
                  #create a new range and change the end of the existing range
                  project_role.planning_times.create({:begin_date => begin_date, :end_date => end_date, :time_pct => time_pct})
                  pt.end_date = start_date - 1.days
                  pt.save
                  bring_forward = pt
                end
              end
            else # not the first overlapped
              # if it is the same percentage
              # modify this record to contain the time range
              if pt.time_pct == bring_forward.time_pct
                
                if pt.end_date > bring_forward.end_date
                  bring_forward.end_date = pt.end_date
                  bring_forward.save
                else
                  done = true
                end
                destroy_list.push(pt.id)
              else 
                # not the same percentage
                # does the new range totally overlap this range
                # if so, git rid of this range and update bring_forward
                if pt.end_date <= bring_forward.end_date
                  
                  if pt.end_date == bring_forward.end_date
                    done = true
                  else
                    bring_forward.end_date = pt.end_date
                    bring_forward.save
                  end
                  
                  destroy_list.push(pt.id)
                else 
                  # overlaps the head
                  # change the start of the existing range
                  pt.start_date = bring_forward.end_date + 1.days
                  pt.save
                  done = true
                
                end
              end
            end
          end
        end
      end
      # no records joined or overlapped
      if !overlapped
        project_role.planning_times.create({:begin_date => begin_date, :end_date => end_date, :time_pct => time_pct})
      end
      if !destroy_list.empty
        destroy_list.each do destroyme
          destroy(destroyme)
        end
      end
      if bring_forward && bring_forward.time_pct == 0.0
        destroy(bring_forward.id)
      end
    end
  end
end
