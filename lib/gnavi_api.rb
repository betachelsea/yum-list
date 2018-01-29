class GnaviApi
  class << self
    def search_restaurants(name)
      req = conn.get('/RestSearchAPI/20150630', { keyid: Settings.gnavi.access_key, name: name, format: 'json' })
      JSON.parse(req.body)
    end

    private def conn
      @conn ||= Faraday::Connection.new(url: 'https://api.gnavi.co.jp')
    end
  end
end
