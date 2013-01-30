class Song < ActiveRecord::Base
  attr_accessible :name, :artist_id

  belongs_to :artist

  has_many :recordings, :through => :artist, :source => :performed_songs
  has_many :recorded_bands, :through => :artist, :source => :band, :foreign_key => :band_id
end