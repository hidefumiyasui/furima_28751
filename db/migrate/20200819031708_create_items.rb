class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image_url
      t.string :name
      t.text	 :explanation
      t.integer :categorie_id
      t.integer :condition_id
      t.integer :shipping_charge_id
      t.integer :shipping_region_id
      t.integer :delivery_days_id
      t.integer :price
      t.references :user
      t.timestamps
    end
  end
end
