class User < ActiveRecord::Base
  has_secure_password
  
  has_many :owners
  has_many :walkers
end
