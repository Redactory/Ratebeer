class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

# Lomakkeen renderöinnistä vastaava metodi.
  def new
    @rating = Rating.new
    @beers = Beer.all
  end

# Uuden olion luonnista vastaava metodi.
  def create
    Rating.create params.require(:rating).permit(:score, :beer_id)
    redirect_to ratings_path
  end

# Arvion tuhoamisesta vastaava metodi.
  def destroy
    rating = Rating.find(params[:id])
    rating.delete
    redirect_to ratings_path
  end
end
