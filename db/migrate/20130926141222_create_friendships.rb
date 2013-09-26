class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :stalker_id, null: false
      t.integer :victim_id, null: false

      t.timestamps
    end

    add_index :friendships, :stalker_id
    add_index :friendships, :victim_id
  end
end
