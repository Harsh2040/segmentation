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
    segment_number = 1
    # 4 neighbor: processed: up and left
    strategy = { :processed => [[-1,0],[0,-1]],
                 :not_processed => [[1,0],[0,1]] }

    @grid.each_with_index do |row, i|
      row.each_with_index do |value, j|
        next if value == 0

        @grid[i][j] = segment_number += 1
        do_strategy(strategy, :processed, i, j)
        do_strategy(strategy, :not_processed, i, j)
      end
    end

    re_number_segments
  end

  def print_image
    @grid.each do |row|
      row.each do |value|
        print "#{value} ".ljust(4, ' ').rjust(4, ' ')
      end
      print "\n"
    end
  end

  private

  # status is either :processed or :not_processed
  def do_strategy(strategy, status, row, column)
    value = @grid[row][column]

    strategy[status].each do |coords|
      neighbor = [row + coords.first, column + coords.last]

      next unless neighbor.first >= 0 && neighbor.first < @rows
      next unless neighbor.last >= 0 && neighbor.last < @columns

      neighbor_value = @grid[neighbor.first][neighbor.last]
      next if neighbor_value == 0

      @grid[neighbor.first][neighbor.last] = value
      change_segments(neighbor_value, value) if status == :processed
    end
  end

  # change all segments of the old value to the new value
  def change_segments(old_value, new_value)
    @grid.each do |row|
      row.map! { |number| number == old_value ? new_value : number }
    end
  end

  # start segment numbers at 1
  def re_number_segments
    segments = @grid.flatten.uniq.delete_if{ |number| number == 0 }
    segments.each_with_index do |number, i|
      change_segments(number, i + 1)
    end
  end
end
