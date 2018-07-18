class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :publisher
      t.string :status
      t.datetime :free_time

      t.timestamps
    end
  end
end
