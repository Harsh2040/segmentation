class NeighborStrategy
  attr_accessor :processed, :not_processed

  def initialize(number = 4)
    @processed, @not_processed = build_neighbor_lists(number)
  end

  def build_neighbor_lists(number)
    processed = [[-1,0],[0,-1]]
    not_processed = [[1,0],[0,1]]
    if number == 6
      processed << [-1,-1]
      not_processed << [1,1]
    elsif number == 8
      processed += [[-1,-1], [-1,1]]
      not_processed += [[1,1], [1,-1]]
    end

    [processed, not_processed]
  end
end
