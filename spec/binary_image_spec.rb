require_relative 'spec_helper'

describe BinaryImage do

  raw_image = [[1,0,0,1,0,1],
               [1,1,0,0,0,1],
               [1,1,1,1,1,1]]

  let(:image) { BinaryImage.new(raw_image) }
  subject{ image }

  describe "#initialize" do
    describe "it should correctly set the rows and columns" do
      its(:rows) { should == 3 }
      its(:columns) { should == 6 }
    end
  end
end
