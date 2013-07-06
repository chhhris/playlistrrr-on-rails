class Song < ActiveRecord::Base
  attr_accessible :name
  belongs_to :artist
  belongs_to :genre

  def youtube
    YoutubeSearch.search("#{self.artist.name} #{self.name}").first
  end

end 