class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :p_name
      t.text :p_introduction
      t.integer :p_price
      t.string :p_adress
      t.string :p_image
      t.float :p_menseki

      t.timestamps
    end
  end
end
