require 'date'
require_relative '../spec_helper'

RSpec.describe Apartment do

  let(:lease_start) { Date.parse("2016-2-1") }
  let(:lease_end) { Date.parse("2017-1-31") }

  let(:occupant) { Occupant.new("John", "Denver") }
  let(:occupant2) { Occupant.new("Elvis", "Presley") }

  let(:apartment) do
    Apartment.new("123 Main St", "CityTown",
                  "12345", 2000, lease_start, lease_end, 2)
  end

  let(:occupants) { [occupant, occupant, occupant2] }

  let(:apartment2) do
    Apartment.new("123 Main St", "CityTown",
                  "12345", 2000, lease_start, lease_end, 2, occupants)
  end

  describe "#initialize" do
    it "has a readable address" do
      expect(apartment.address).to eq("123 Main St")
    end

    it "does not have a writeable address" do
      expect{ apartment.address = "723 Osh Kosh" }.to raise_error(NoMethodError)
    end

    it "has a readable city_town" do
      expect(apartment.city_town).to eq("CityTown")
    end

    it "does not have a writeable city_town" do
      expect { apartment.city_town = "723 Osh Kosh" }
        .to raise_error(NoMethodError)
    end

    it "has a readable zip_code" do
      expect(apartment.zip_code).to eq("12345")
    end

    it "does not have a writeable zip_code" do
      expect{ apartment.zip_code = "00100" }.to raise_error(NoMethodError)
    end

    it "has a readable rent price" do
      expect(apartment.rent).to eq(2000)
    end

    it "does not have a writeable rent price" do
      expect{ apartment.rent_price = 3000 }.to raise_error(NoMethodError)
    end

    it "has a lease start date" do
      expect(apartment.lease_start).to be_a(Date)
    end

    it "does not have a writeable start date" do
      expect{ apartment.lease_start = "some other day" }
        .to raise_error(NoMethodError)
    end

    it "has a lease end date" do
      expect(apartment.lease_end).to be_a(Date)
    end

    it "does not have a writeable lease end date" do
      expect{ apartment.lease_end = "some other day" }
        .to raise_error(NoMethodError)
    end

    it "has attribute capacity" do
      expect(apartment.capacity).to eq(2)
    end

    it "does not have a writeable attribute capacity" do
      expect{ apartment.capacity = 6 }.to raise_error(NoMethodError)
    end

    it "will not accept more rommates than capacity" do
      expect { apartment2 }.to raise_error(ExceedsCapacityError)
    end

  end

  describe "#add occupant" do
    it "adds occupants" do
      expect(apartment.items.size).to eq(0)
      expect(apartment.add_item(occupant)).to eq(true)
      expect(apartment.items.size).to eq(1)
    end

    it "adds occupants only if there is vacancy" do
      apartment.add_item(occupant)
      apartment.add_item(occupant2)
      expect { apartment.add_item(occupant) }
        .to raise_error(AtCapacityError)
    end
  end

  describe "#remove occupant" do
    it "removes occupants" do
      apartment.add_item(occupant)
      apartment.add_item(occupant2)
      expect(apartment.remove_item(occupant2)).to eq(true)
      expect(apartment.items.size).to eq(1)
    end


    it "does not remove a occupant if occupant does not exist" do
      expect { apartment.remove_item(occupant) }
        .to raise_error(NoItemFoundError)
    end

  end

  describe "#full?" do
    it "returns true if at capacity" do
      apartment.add_item(occupant)
      apartment.add_item(occupant2)
      expect(apartment.full?).to eq(true)
    end

    it "returns false if not at capacity" do
      apartment.add_item(occupant)
      expect(apartment.full?).to eq(false)
    end
  end

end
