class BinaryImage
  attr_accessor :grid, :rows, :columns

  def initialize(grid)
    @grid = grid
    @rows = grid.length
    @columns = grid.first.length
  end

  def count_segments
    @grid.flatten.uniq.delete_if{ |number| number == 0 }.length
  end

  def segment!
    object_number = 1
    # 4 neighbor: processed: up and left
    strategy = { :processed => [[-1,0],[0,-1]],
                 :not_processed => [[1,0],[0,1]] }

    @grid.each_with_index do |row, i|
      row.each_with_index do |value, j|
        next if value == 0

        value = @grid[i][j] = object_number += 1

        strategy[:processed].each do |coords|
          neighbor = [i + coords.first, j + coords.last]

          next unless neighbor.first >= 0 && neighbor.first < @rows
          next unless neighbor.last >= 0 && neighbor.last < @columns

          neighbor_value = @grid[neighbor.first][neighbor.last]
          next if neighbor_value == 0

          @grid[neighbor.first][neighbor.last] = value
          change_objects(neighbor_value, value)
        end

        strategy[:not_processed].each do |coords|
          neighbor = [i + coords.first, j + coords.last]

          next unless neighbor.first >= 0 && neighbor.first < @rows
          next unless neighbor.last >= 0 && neighbor.last < @columns

          neighbor_value = @grid[neighbor.first][neighbor.last]
          next if neighbor_value == 0

          @grid[neighbor.first][neighbor.last] = value
        end
      end
    end
  end

  private
  # change all objects of the old value to the new value
  def change_objects(old_value, new_value)
    @grid.each do |row|
      row.map! { |number| number == old_value ? new_value : number }
    end
  end
end
