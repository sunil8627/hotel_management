class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :room_no
      t.boolean :is_occupied
      t.integer :room_type_id

      t.timestamps
    end
  end
end
