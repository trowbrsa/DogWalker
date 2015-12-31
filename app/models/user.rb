class User < ActiveRecord::Base
  has_secure_password
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :owners
  has_many :walkers
end
