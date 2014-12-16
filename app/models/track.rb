class Track < ActiveRecord::Base

  mount_uploader :track_file, TrackFileUploader

  belongs_to :genre
  belongs_to :user
end