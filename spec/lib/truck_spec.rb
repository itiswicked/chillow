require 'spec_helper'

RSpec.describe Truck do

  let(:occupant) { Occupant.new("David", "Bowie") }
  let(:occupant2) { Occupant.new("David", "Byrne") }
  let(:occupant3) { Occupant.new("David", "Lee Roth") }
  let(:box) { Box.new(occupant) }
  let(:box2) { Box.new(occupant2) }
  let(:box3) { Box.new(occupant3) }
  let(:truck) { Truck.new(60) }


  describe "#initialize" do
    it "has a capacity" do
      expect(truck.capacity).to eq(60)
    end

    it "can hold boxes" do
      expect(truck.items).to be_an(Array)
    end
  end

  describe "#add_item" do
    it "adds a box" do
      expect(truck.add_item(box)).to eq(true)
      expect(truck.items.size).to eq(1)
    end

    it "adds boxes only while there is room" do
      60.times { truck.add_item(box) }
      expect { truck.add_item(box) }.to raise_error(AtCapacityError)
    end
  end

  describe "#remove_item" do
    it "removes a box" do
      truck.add_item(box)
      truck.add_item(box2)
      expect(truck.remove_item(box2)).to eq(true)
      expect(truck.items.size).to eq(1)
      expect(truck.items.first).to eq(box)
    end

    it "does not remove a box if it does not exist" do
      expect{ truck.remove_item(box) }.to raise_error(NoItemFoundError)
    end
  end

  describe "#full?" do
    it "returns true if number of boxes == capacity" do
      truck.capacity.times { truck.add_item(box) }
      expect(truck.full?).to eq(true)
    end

    it "returns false if number of boxes not at capicity" do
      expect(truck.full?).to eq(false)
    end
  end

  describe "#unload_occupant_boxes" do
    it "removes all boxes for a particular occupant" do
      10.times { truck.add_item(box) }
      10.times { truck.add_item(box2) }
      expect(truck.remove_occupant_boxes(occupant2)).to eq(true)
      expect(truck.items.include?(box2)).to eq(false)
      expect(truck.items.empty?).to eq(false)
    end

    it "does not remove a box if there are no occupant boxes" do
      expect { truck.remove_occupant_boxes(occupant3) }
        .to raise_error(NoItemFoundError)
    end
  end

end
