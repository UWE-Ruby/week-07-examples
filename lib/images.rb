require 'rmagick'

image = Magick::Image.read('shock.jpg').first

image.each_pixel do |pixel,column,row|
  
  puts %{PIXEL (#{row},#{column}) is #{pixel}}
  
end