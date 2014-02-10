class Pizza
end

class Topping
  attr_accessor :name
  def initialize(name)
    @name=name
    @vegetarian = true
  end
end
