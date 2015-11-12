require_relative 'dwelling'

class Apartment < Dwelling
  attr_reader :rent, :lease_start, :lease_end, :bedrooms, :items, :capacity
  include ItemHolding

  def initialize(address, city_town, zip_code, rent, lease_start, lease_end,
                 capacity, occupants = [])
    @rent = rent
    @lease_start = lease_start
    @lease_end = lease_end
    @capacity = capacity
    @items = occupants
    super(address, city_town, zip_code)
    raise ExceedsCapacityError if over_capacity?
  end

  def over_capacity?
    items.size > capacity
  end

end

class ExceedsCapacityError < StandardError
end
