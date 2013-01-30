class Recording < ActiveRecord::Base
  attr_accessible :song_id, :band_id

  belongs_to :song
  belongs_to :band
end