class Movie < ActiveRecord::Base
validates_presence_of :title

attr_accessor :small_image

belongs_to :user

end
