class SongsController < ApplicationController

  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(params[:song])
    redirect_to artist_path(@artist)
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs.find(params[:id])
    @songs.destroy
    redirect_to artist_path(@artist)
  end

  def show
    # @artist = Artist.find(params[:id])
    # @songs = @artist.songs.find(params[:id])
    @song = Song.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  # def destroy
  #   @song = Song.find(params[:id])
  #   @song.destroy

  #   respond_to do |format|
  #     format.html { redirect_to songs_url }
  #     format.json { head :no_content }
  #   end
  # end

end

  # def create
  #   @artist = @artist.songs.create(params[:songs])
  #   redirect_to artist_path(@artist)
  # end
