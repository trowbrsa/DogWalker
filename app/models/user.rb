class User < ActiveRecord::Base
  has_secure_password
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, confirmation: true
  validates :email_confirmation, presence: true

  has_many :owners
  has_many :walkers
end
