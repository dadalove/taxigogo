class Car < ActiveRecord::Base
  
  has_many :orders

  reverse_geocoded_by :latitude, :longitude


  ["台北市羅斯福路二段70號", "台北市信義路二段48號","台北市重慶南路一段50號","台北市仁愛路一段39號","台北市大安森林公園"].each_with_index do |addr, i|
    g = Geocoder.coordinates(addr)
    Car.create!( :name => "Car #{i}", :latitude => g[0], :longitude => g[1] )
    puts "Created Car #{i} at #{g[0]}, #{g[1]}"
  end

end
