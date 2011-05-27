class Movie < ActiveRecord::Base
validates_presence_of :title
attr_accesor :small_image
end
