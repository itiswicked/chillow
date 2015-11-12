class AtCapacityError < StandardError
end

class NoItemFoundError < StandardError
end

module ItemHolding

  def add_item(item)
    unless full?
      items << item
      true
    else
      raise AtCapacityError
    end
  end

  def remove_item(item)
    return true if items.reject! { |existing_item| existing_item == item }
    raise NoItemFoundError
  end

  def full?
    items.size >= capacity
  end

end
