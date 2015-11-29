class User < ActiveRecord::Base
  has_many :owners
  has_many :walkers
end
