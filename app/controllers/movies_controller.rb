class MoviesController < ApplicationController
  def index
    if params[:query].present? && !params[:query].blank?
      @movies = Searchkick.search(params[:query], models: [Movie, TvShow], misspellings: {edit_distance: 1})
    else
      @movies = Searchkick.search("*", models: [Movie, TvShow])
    end

    respond_to do |format|
      format.html # Follow the normal rails flow
      # If we have a different response we need to tell how to handle it
      format.text { render partial: "shared/movies", locals: { movies: @movies }, formats: [:html] }
    end
  end
end
