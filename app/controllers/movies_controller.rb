class MoviesController < ApplicationController
  def index
    if params[:query].present? && !params[:query].blank?
      @movies = Searchkick.search(params[:query], models: [Movie, TvShow], misspellings: {edit_distance: 1})
    else
      @movies = Searchkick.search("*", models: [Movie, TvShow])
    end
  end
end
