require 'spec_helper'

RSpec.describe Occupant do

  let(:occupant) { Occupant.new("John", "Denver") }

  describe "#initialize" do

    it "has a first name" do
      expect(occupant).to be_an(Occupant)
      expect(occupant.first_name).to eq("John")
    end

    it "does not have writeable first name" do
      expect { occupant.first_name = "Mike" }.to raise_error(NoMethodError)
    end

    it "has a last name" do
      expect(occupant.last_name).to eq("Denver")
    end

    it "does not have writeable last name" do
      expect { occupant.last_name = "Laganitas" }.to raise_error(NoMethodError)
    end

  end
  it "is a pending example" do
  end
end
