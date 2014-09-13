class Car < ActiveRecord::Base
  
  has_many :orders

  reverse_geocoded_by :latitude, :longitude

  # def gmaps4rails_marker_picture
  #   {
  #    "picture" => "/images/taxi.png",
  #    "width" => 20,
  #    "height" => 20,
  #    "marker_anchor" => [ 5, 10],
  #    "shadow_picture" => "/images/morgan.png" ,
  #    "shadow_width" => "110",
  #    "shadow_height" => "110",
  #    "shadow_anchor" => [5, 10],
  #   }
  # end

  # ["台北市羅斯福路二段70號","台北市仁愛路三段39號"].each_with_index do |addr, i|
  #   g = Geocoder.coordinates(addr)
    
  #   Car.create!( :name => "Car #{i}", :latitude => g[0], :longitude => g[1] )

    #Car.create!( :name => "Car #{i}", :latitude => g[0], :longitude => g[1], :picture => "/images/taxi.png" )
    
    #puts "Created Car #{i} at #{g[0]}, #{g[1]}"
  # end

end
