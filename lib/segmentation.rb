require_relative 'segmentation/neighbor_strategy'
require_relative 'segmentation/binary_image'

module Segmentation
  extend self

  def random_raw_binary_image(size)
    raw_image = Array.new(size).map { Array.new(size) }
    raw_image.map! { |row| row.map { rand(0..1) } }

    raw_image
  end
end
