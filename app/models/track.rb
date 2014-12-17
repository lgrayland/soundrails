class Track < ActiveRecord::Base

  acts_as_commentable

  mount_uploader :track_file, TrackFileUploader

  belongs_to :genre
  belongs_to :user
end