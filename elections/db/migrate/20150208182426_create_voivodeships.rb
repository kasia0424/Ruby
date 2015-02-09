class CreateVoivodeships < ActiveRecord::Migration
  def change
    create_table :voivodeships do |t|
      t.string :name
      t.integer :mandates

      t.timestamps
    end
  end
end
