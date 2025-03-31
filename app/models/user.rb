class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :username, presence: true, uniqueness: true, length: { in: 4..12 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { in: 8..16 }
end
