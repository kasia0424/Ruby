class CreateCostituencies < ActiveRecord::Migration
  def change
    create_table :constituencies do |t|
      t.integer :entitled
      t.integer :invalid_votes
      t.integer :valid_votes
      t.integer :given_cards
      t.integer :empty_cards
      t.integer :multiple_choice
      t.integer :other_invalid
      t.references :voivodeship

      t.timestamps
    end
    add_index :constituencies, :voivodeship_id
  end
end
