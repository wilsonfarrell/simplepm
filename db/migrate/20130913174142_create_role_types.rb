class CreateRoleTypes < ActiveRecord::Migration
  def change
    create_table :role_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
