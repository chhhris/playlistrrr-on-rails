require 'oembed'

class Song < ActiveRecord::Base
  attr_accessible :name, :artist_id, :genre_id
  belongs_to :artist
  belongs_to :genre

  # def youtube
  #   YoutubeSearch.search("#{self.artist.name} #{self.name}").first
  # end

  def self.new_from_params(params)
    self.new.tap do |s|
      s.name = params[:song_name]
      s.genre = Genre.find_or_create_by_name(params[:genre_name])
      Artist.find_or_create_by_name(params[:artist_name]).add_song(s)
    end
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def title
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def youtube_url
    id = YoutubeSearch.search("#{self.artist.name} - #{self.name}").first["video_id"]
    url = "http://www.youtube.com/watch?v=#{id}"
  end

  def embedcode
    OEmbed::Providers::Youtube.get(self.youtube_url).html
  end
end 