class BinaryImage
  attr_accessor :grid, :rows, :columns

  def initialize(grid)
    @grid = grid
    @rows = grid.length
    @columns = grid.first.length
  end
end
