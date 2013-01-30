class Band < ActiveRecord::Base
  attr_accessible :name

  has_many :artists
  has_many :recordings
  has_many :songs, :through => :recordings

  def self.same_recording
    Band.select('bands.*, recordings.*, COUNT(*) AS song_count')
    .joins(:recordings)
    .includes(:songs)
    .group(:band_id)
    .having('song_count > 1')
    .all
  end
end