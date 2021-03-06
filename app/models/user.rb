class User < ApplicationRecord

  has_secure_password

  has_many :posts, dependent: :nullify
  has_many :votes, dependent: :destroy
  has_many :voted_posts, through: :votes, source: :post
  has_many :comments, dependent: :destroy

  before_validation :downcase_email

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL

  def full_name
    "#{first_name} #{last_name}".strip.titleize
  end

  private

  def downcase_email
    self.email&.downcase!
  end
end
