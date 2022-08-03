class AddCoverImageUrlToAddProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :add_products, :cover_image_url, :string
  end
end
