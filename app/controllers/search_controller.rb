class SearchController < ApplicationController

  def index
    @response = GnaviApi.search_restaurants(params[:q])
  end

end
