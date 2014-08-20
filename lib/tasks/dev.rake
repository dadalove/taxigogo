task :fake => :environment do
  
  Car.delete_all

  ["台北市羅斯福路二段70號", "台北市羅斯福路二段170號","台北市重慶南路一段50號"].each_with_index do |addr, i|
    g = Geocoder.coordinates(addr)
    Car.create!( :name => "Car #{i}", :latitude => g[0], :longitude => g[1] )
    puts "Created Car #{i} at #{g[0]}, #{g[1]}"
  end


end