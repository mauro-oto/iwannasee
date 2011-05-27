class User < ActiveRecord::Base
  acts_as_authentic
  attr_accesor :persistence_token
  has_many :movies
end
