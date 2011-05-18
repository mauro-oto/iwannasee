class Movie < ActiveRecord::Base
validates_presence_of :title, :rating , :cuevana , :year
end
