class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :book_id
      t.integer :user_id
      t.datetime :start
      t.datetime :finish
      t.boolean :accept

      t.timestamps
    end
    add_index :requests, :book_id
    add_index :requests, :user_id
    add_index :requests, [:book_id, :user_id]
  end
end
