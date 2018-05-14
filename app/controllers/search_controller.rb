class SearchController < ApplicationController

  def index
    @gnavi_restaurants = GnaviApi.search_restaurants(params[:q])
  end

end
