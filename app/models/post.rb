class Post < ApplicationRecord

  mount_uploader :image, ImageUploader

  has_many :comments, {dependent: :destroy}
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  belongs_to :user

  validates :title, presence: true
  validates :image, presence: true


  def vote_for(user)
    votes.find_by(user: user)
  end

  def votes_total
    votes.up.count - votes.down.count
  end

end
