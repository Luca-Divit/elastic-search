class Movie < ApplicationRecord
  belongs_to :director
  searchkick
end
