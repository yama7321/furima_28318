class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :image, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.string :category, null: false
      t.string :status, null: false
      t.string :shipping_cost, null: false
      t.integer :perfecture_id, null: false
      t.string :shipping_days, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.boolean :sold_out, default: false
      t.timestamps
    end
  end
end
