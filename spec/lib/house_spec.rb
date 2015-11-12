require_relative '../spec_helper'

RSpec.describe House do

  let(:house) { House.new("123 Main St", "CityTown", "12345", 450_000) }

  describe "#initialize" do
    it "has a readable address" do
      expect(house.address).to eq("123 Main St")
    end

    it "does not have a writeable address" do
      expect{ house.address = "723 Osh Kosh" }.to raise_error(NoMethodError)
    end

    it "has a readable city_town" do
      expect(house.city_town).to eq("CityTown")
    end

    it "does not have a writeable city_town" do
      expect{ house.city_town = "723 Osh Kosh" }.to raise_error(NoMethodError)
    end

    it "has a readable zip_code" do
      expect(house.zip_code).to eq("12345")
    end

    it "does not have a writeable zip_code" do
      expect{ house.zip_code = "00100" }.to raise_error(NoMethodError)
    end

    it "has a readable and writeable asking price" do
      expect(house.asking_price).to eq(450_000)
      expect(house.asking_price = 425_000).to eq(425_000)
    end

  end
end
