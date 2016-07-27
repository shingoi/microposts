class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  mount_uploader :image, ImageUploader
end
