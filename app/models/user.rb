class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :rememberable, :trackable, :validatable

  mount_uploader :user_image, UserImageUploader

before_validation :set_role

  has_many :tracks

  def set_role
    self.role ||= :artist
  end

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end
end
