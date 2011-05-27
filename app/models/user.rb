class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessor :persistence_token
  has_many :movies
end
