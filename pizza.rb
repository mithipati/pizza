class Pizza
end

class Topping
  attr_accessor :name, :vegetarian
  def initialize(name, vegetarian: false)
    @name=name
    @vegetarian = true
  end
end
