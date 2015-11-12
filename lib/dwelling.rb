class Dwelling
  attr_reader :address, :city_town, :zip_code

  def initialize(address, city_town, zip_code)
    @address = address
    @city_town = city_town
    @zip_code = zip_code
  end

end
