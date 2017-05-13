class Post < ApplicationRecord

  has_many :comments, {dependent: :destroy}
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  belongs_to :users

  validates :title, presence: true

  def liked_by(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by(user: user)
  end

end
