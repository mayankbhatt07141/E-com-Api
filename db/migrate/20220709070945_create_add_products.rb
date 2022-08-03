class CreateAddProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :add_products do |t|
      t.string :name
      t.string :product_description
      t.string :category
      t.string :brand_name
      t.string :custom
      t.string :tags
      t.string :sleeves
      t.string :top_design
      t.string :bottom_design
      t.string :material
      t.string :size
      t.integer :designer_fee
      t.integer :material_fee
      t.integer :manufacture_fee
      t.integer :total_price
      t.integer :gomble_service_fee
      t.integer :amount_receive
      t.string :country
      t.string :product_id
      t.string :hs_code
      t.string :cover_image_url
      t.timestamps
    end
  end
end
