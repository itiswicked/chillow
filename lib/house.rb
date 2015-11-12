class House < Dwelling
  attr_accessor :asking_price

  def initialize(address, city_town, zip_code, asking_price)
    @asking_price = asking_price
    super(address, city_town, zip_code)
  end
end
