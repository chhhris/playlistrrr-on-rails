class Artist < ActiveRecord::Base
  attr_accessible :name, :songs
  validates :name, :presence => true
  has_many :songs, :dependent => :destroy

  accepts_nested_attributes_for :songs, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  def add_songs(songs)
    songs.each do |song_hash|
      s = Song.new
      s.genre = Genre.find_or_create_by_name(song_hash[:genre])
      s.name = song_hash[:name]
      self.add_song(s)
    end
  end

  def self.reset_artists
    reset_all
  end

  def genres
    songs.collect{|s| s.genre}.flatten.compact.uniq
  end

  def songs_count
    songs.size
  end

  def add_song(song)
    songs << song
    song.artist = self
  end
end
