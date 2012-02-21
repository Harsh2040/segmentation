require_relative 'spec_helper'

describe Segmentation do

  let(:image) { BinaryImage.new(raw_image) }
  let(:number_of_segments) { image.count_segments }
  subject{ number_of_segments }

  describe "segment an image using the default strategy" do
    let(:raw_image) { [[1,0,0,1,0,1],
                       [1,1,1,0,1,1],
                       [1,1,1,1,1,1]] }
    before { image.segment(NeighborStrategy.new()) }
    it {should == 2}
  end

  describe "segment an image using the 4-neighbor strategy" do
    let(:raw_image) { [[1,0,0,1,0,1],
                       [1,1,1,0,1,1],
                       [1,1,1,1,1,1]] }
    before { image.segment(NeighborStrategy.new(4)) }
    it {should == 2}
  end

  describe "segment an image using the 6-neighbor strategy" do
    let(:raw_image) { [[1,0,0,1,0,1],
                       [1,1,0,0,1,1],
                       [1,1,1,1,1,1]] }
    before { image.segment(NeighborStrategy.new(6)) }
    it {should == 1}
  end

  describe "segment an image using the 8-neighbor strategy" do
    let(:raw_image) { [[1,0,0,1,0,1],
                       [1,1,1,0,0,1],
                       [1,1,1,1,1,1]] }
    before { image.segment(NeighborStrategy.new(8)) }
    it {should == 1}
  end
end
