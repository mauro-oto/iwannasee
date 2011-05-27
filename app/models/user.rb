class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessor :persistence_token, :persistence_token_changed?
  has_many :movies
end
