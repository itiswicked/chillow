require_relative '../spec_helper'

RSpec.describe Box do

  let(:occupant) { Occupant.new("John", "Denver") }

  let(:box) { Box.new(occupant) }

  describe "#initialize" do

    it "has an owner" do
      expect(box.owner).to be_an(Occupant)
    end

  end

end
