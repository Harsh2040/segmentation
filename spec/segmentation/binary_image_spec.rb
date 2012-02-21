require_relative '../spec_helper'

describe BinaryImage do

  let(:raw_image) { [[1,0,0,1,0,1],
                     [1,1,0,0,0,1],
                     [1,1,1,1,1,1]] }

  let(:image) { BinaryImage.new(raw_image) }

  describe "#initialize" do
    subject{ image }

    describe "it should correctly set the rows and columns" do
      its(:rows) { should == 3 }
      its(:columns) { should == 6 }
    end
  end

  describe "#count_segments" do
    describe "it should find all of the segments" do
      let(:number_of_segments) { image.count_segments }
      subject{ number_of_segments }

      context "before image has been segmented" do
        it { should == 1 }
      end

      context "after image has been segmented" do
        before do
          strategy = double()
          strategy.should_receive(:processed).exactly(12).times.and_return( [[-1,0],[0,-1]] )
          strategy.should_receive(:not_processed).exactly(12).times.and_return( [[1,0],[0,1]] )

          image.segment(strategy)
        end

        it { should == 2 }
      end
    end
  end
end
