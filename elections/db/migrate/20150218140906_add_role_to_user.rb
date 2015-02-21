class AddRoleToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :role, index: true 
    end
  end
  def down
    change_table :users do |t|
      t.remove :role
    end
  end
end
