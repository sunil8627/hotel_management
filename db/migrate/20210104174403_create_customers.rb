class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :age
      t.string :ID_card_no
      t.integer :room_id
      t.datetime :check_in_at
      t.datetime :check_out_at

      t.timestamps
    end
  end
end
