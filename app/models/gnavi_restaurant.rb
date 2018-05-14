class GnaviRestaurant
  include ActiveModel::Model

  attr_accessor :id, :name, :category, :url, :url_mobile,
                :shop_image1, :shop_image2, :address, :pr_short, :pr_long
end
