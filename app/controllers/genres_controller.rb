class GenresController < ApplicationController
  def create
    @artist = Artist.find(params[:artist_id])
    @genre = @artist.genres.create(params[:genre])
    redirect_to artist_path(@artist)
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @genres = @artist.genres.find(params[:id])
    @genres.destroy
    redirect_to artist_path(@artist)
  end

  def show
    # @artist = Artist.find(params[:id])
    # @genres = @artist.genres.find(params[:id])
    @genre = Genre.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end

end
