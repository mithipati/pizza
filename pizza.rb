class Pizza
  attr_accessor :toppings
  def initialize( toppings = [ Topping.new('cheese') ] )
    @toppings = toppings
  end

  def vegetarian?
    @toppings.all? { |topping| topping.vegetarian == true }
  end

  def add_topping(new_topping)
    @toppings << new_topping
    new_topping
  end
end

class Topping
  attr_accessor :name, :vegetarian
  def initialize(name, vegetarian: false)
    @name = name
    @vegetarian = vegetarian
  end
end
