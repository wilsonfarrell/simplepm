class CreatePlanningTimes < ActiveRecord::Migration
  def change
    create_table :planning_times do |t|
      t.references :project_role
      t.date :start_date
      t.date :end_date
      t.float :time_pct

      t.timestamps
    end
    add_index :planning_times, :project_role_id
  end
end
