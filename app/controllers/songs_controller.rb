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

  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

end

