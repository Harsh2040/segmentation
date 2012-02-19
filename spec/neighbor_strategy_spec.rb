require_relative "spec_helper"

describe NeighborStrategy do
  describe "#initialize" do
    let(:processed) { strategy.processed }
    let(:not_processed) { strategy.not_processed }

    context "default neighbor" do
      let(:strategy) { strategy = NeighborStrategy.new() }

      subject { processed }
      its(:length) { should == 2 }

      subject { not_processed }
      its(:length) { should == 2 }
    end

    context "four neighbor" do
      let(:strategy) { strategy = NeighborStrategy.new(4) }

      subject { processed }
      its(:length) { should == 2 }

      subject { not_processed }
      its(:length) { should == 2 }
    end

    context "six neighbor" do
      let(:strategy) { strategy = NeighborStrategy.new(6) }

      subject { processed }
      its(:length) { should == 3 }

      subject { not_processed }
      its(:length) { should == 3 }
    end

    context "eight neighbor" do
      let(:strategy) { strategy = NeighborStrategy.new(8) }

      subject { processed }
      its(:length) { should == 4 }

      subject { not_processed }
      its(:length) { should == 4 }
    end
  end
end
