class Truck
  attr_reader :capacity, :items
  include ItemHolding

  def initialize(capacity)
    @capacity = capacity
    @items = []
  end

  def remove_occupant_boxes(occupant)
    return true if items.reject! { |box| box.owner == occupant }
    raise NoItemFoundError
  end

end
