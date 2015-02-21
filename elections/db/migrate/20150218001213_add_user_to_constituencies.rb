class AddUserToConstituencies < ActiveRecord::Migration
  def change
    change_table :constituencies do |t|
      t.references :user, index: true 
    end
  end
  def down
    change_table :constituencies do |t|
      t.remove :user
    end
  end
end
