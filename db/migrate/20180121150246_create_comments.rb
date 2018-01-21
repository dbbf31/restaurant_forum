class CreateComments < ActiveRecord::Migration[5.1]
  def change
    drop_table :comments, force: :cascade
    create_table :comments do |t|
      t.text :content
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end