require_relative '../spec_helper'

RSpec.describe Dwelling do

  let(:dwelling) { Dwelling.new("123 Main St", "CityTown", "12345") }

  describe "#initialize" do
    it "has a readable address" do
      expect(dwelling.address).to eq("123 Main St")
    end

    it "does not have a writeable address" do
      expect{ dwelling.address = "723 Osh Kosh" }.to raise_error(NoMethodError)
    end

    it "has a readable city_town" do
      expect(dwelling.city_town).to eq("CityTown")
    end

    it "does not have a writeable city_town" do
      expect{ dwelling.city_town = "723 Osh Kosh" }.to raise_error(NoMethodError)
    end

    it "has a readable zip_code" do
      expect(dwelling.zip_code).to eq("12345")
    end

    it "does not have a writeable zip_code" do
      expect{ dwelling.zip_code = "00100" }.to raise_error(NoMethodError)
    end
  end

end
