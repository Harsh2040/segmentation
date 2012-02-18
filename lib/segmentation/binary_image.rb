class BinaryImage
  attr_accessor :grid, :rows, :columns

  def initialize(grid)
    @grid = grid
    @rows = grid.length
    @columns = grid.first.length
  end

  def count_segments
    segments = @grid.flatten.uniq.delete_if{ |number| number == 0 }.length
  end

  def segment_image!
  end
end
