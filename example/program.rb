require_relative "../lib/segmentation"

raw_image = Segmentation.random_raw_binary_image(20)
image = BinaryImage.new(raw_image)
image.print_image
puts "----------------------------------------------------------------------------"
image.segment(NeighborStrategy.new(6))
image.print_image
