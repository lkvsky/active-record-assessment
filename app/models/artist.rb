class Artist < ActiveRecord::Base
  attr_accessible :name, :band_id

  belongs_to :band
  has_many :authored_songs, :class_name => "Song", :foreign_key => :artist_id
  has_many :performed_songs, :through => :band, :source => :recordings

  def self.song_count
    artists_songs = Artist.includes(:authored_songs)

    artist_song_count = {}
    artists_songs.each do |artist|
      artist_song_count[artist] = artist.authored_songs.count
    end

    artist_song_count
  end
end