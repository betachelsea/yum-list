class GnaviApi
  class << self
    def search_restaurants(name)
      req = conn.get('/RestSearchAPI/20150630', { keyid: Settings.gnavi.access_key, name: name, format: 'json' })
      json = JSON.parse(req.body)
      return [] if json.blank? || json["error"].present?
      # TODO: error処理

      if json["rest"].is_a?(Array)
        json["rest"].map { |rest_hash| gnavi_restaurant(rest_hash) }
      else
        [gnavi_restaurant(json["rest"])]
      end
    end

    private

    def conn
      @conn ||= Faraday::Connection.new(url: 'https://api.gnavi.co.jp')
    end

    def gnavi_restaurant(rest_hash)
      GnaviRestaurant.new(
        id: rest_hash["id"],
        name: rest_hash["name"],
        category: rest_hash["category"],
        url: rest_hash["url"],
        url_mobile: rest_hash["url_mobile"],
        shop_image1: rest_hash["image_url"]["shop_image1"],
        shop_image2: rest_hash["image_url"]["shop_image2"],
        address: rest_hash["address"],
        pr_short: rest_hash["pr"]["pr_short"],
        pr_long: rest_hash["pr"]["pr_long"],
      )
    end
  end
end
