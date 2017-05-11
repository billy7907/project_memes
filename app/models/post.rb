class Post < ApplicationRecord

  has_many :comments, {dependent: :destroy}
  belongs_to :users

  validates :title, presence: true

end
