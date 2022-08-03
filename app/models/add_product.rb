class AddProduct < ApplicationRecord
  has_one_attached :image
  # belons_to :category
  # before_save :grab_image
  def attributes
    {
      'id' => nil,
      'filename'=>nil,
      'io'=>nil,
      'updated_at' => nil,
      'created_at' => nil,
      'attachment_url' => nil
    }
  end

  def grab_image
    #  puts @product[:product][:id]
    #  debugger;
     AddProduct.image.attach(io: @product[:product][:image]  , filename:  @product[:product][:id].to_s)
  end
  def image_url
    Rails.appllication.routes.url_helpers.url_for(image) if image.attached?
  end
end
