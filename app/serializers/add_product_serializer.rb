class AddProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :body, :image ,:image_url
  def image
    if object.image.attached?
      {
        url: rails_blob_url(object.image) if object.image.attached?
      }
    end
  end
end
end
