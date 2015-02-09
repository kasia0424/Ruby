class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :amount
      t.references :constituency
      t.references :committee

      t.timestamps
    end
    add_index :votes, :constituency_id
    add_index :votes, :committee_id
  end
end
