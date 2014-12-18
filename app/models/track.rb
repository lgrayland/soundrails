class Track < ActiveRecord::Base

  acts_as_commentable

  mount_uploader :track_file, TrackFileUploader
  mount_uploader :track_image, TrackImageUploader

  belongs_to :genre
  belongs_to :user

  def comments_needing_approval
    comments.where(status: "draft")
  end

  def self.with_comments_waiting_approval
    joins(:comments).where(comments:{status: "draft"}).distinct
  end
end