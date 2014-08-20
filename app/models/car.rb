class Car < ActiveRecord::Base
  
  has_many :orders

  reverse_geocoded_by :latitude, :longitude

end
