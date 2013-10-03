class CreateProjectRoles < ActiveRecord::Migration
  def change
    create_table :project_roles do |t|
      t.references :project
      t.references :staff
      t.references :role_type

      t.timestamps
    end
    add_index :project_roles, :project_id
    add_index :project_roles, :staff_id
    add_index :project_roles, :role_type_id
  end
end
