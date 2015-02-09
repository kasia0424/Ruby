class CreateComitteesVoivodeships < ActiveRecord::Migration
  def change
    create_table :committees_voivodeships do |t|
      t.references :voivodeship
      t.references :committee

      t.timestamps
    end
    add_index :committees_voivodeships, :voivodeship_id
    add_index :committees_voivodeships, :committee_id
  end
end
