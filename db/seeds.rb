# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Car.destroy_all



["台北市羅斯福路二段70號", "台北市和平東路一段148號","台北市新生南路三段28號","台北市南昌路二段100號","捷運台電大樓"].each_with_index do |addr, i|
    g = Geocoder.coordinates(addr)
    Car.create!( :name => "Car #{i}", :latitude => g[0], :longitude => g[1] )

end 
