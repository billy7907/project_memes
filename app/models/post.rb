class Post < ApplicationRecord

  mount_uploader :image, ImageUploader

  has_many :comments, {dependent: :destroy}
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  belongs_to :user

  validates :title, presence: true

  def liked_by(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by(user: user)
  end

end
