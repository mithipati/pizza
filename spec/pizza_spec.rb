require './pizza'

describe Pizza do
  it "exists" do
    expect(Pizza).to be_a(Class)
  end

  describe '.initialize' do

    it 'records all of the toppings' do
      toppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('pepperoni')
      ]

      pizza = Pizza.new(toppings)

      expect(pizza.toppings).to eq(toppings)
    end

    it 'defaults the toppings to cheese only, if the pizza has no toppings' do
      pizza = Pizza.new

      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
    end
  end

  describe 'vegetarian?' do

    it 'determines if all the toppings are vegetarian' do
      toppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('pepperoni'),
        Topping.new('spinach', vegetarian: true)
      ]

      toppings2 = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('olives', vegetarian: true),
        Topping.new('spinach', vegetarian: true)
      ]

      pizza = Pizza.new(toppings)
      pizza1 = Pizza.new(toppings2)

      expect(pizza.vegetarian?).to eql(false)
      expect(pizza1.vegetarian?).to eql(true)
    end
  end

  describe 'add_topping' do

    it 'adds a topping to the existing toppings array' do
      toppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('pepperoni'),
        Topping.new('spinach', vegetarian: true)
      ]

      new_topping = [
        Topping.new('sausage')
      ]

      pizza = Pizza.new(toppings)

      expect(pizza.add_topping(new_topping)).to eq(new_topping)
      expect(pizza.toppings.count).to eq(4)
    end
  end

  describe 'deliver!' do

    it 'sends out a pizza and marks down the delivery time' do
      pizza = Pizza.new

      expect(pizza.deliver!).to_not eq(Time.now)
    end

  end

  describe 'late?' do

    it 'determines if the pizza was delivered late' do
      pizza = Pizza.new
      pizza.deliver!
      pizza.delivered

      expect(pizza.late?).to eq(false)
    end

  end




end

describe Topping do
  it "exists" do
    expect(Topping).to be_a(Class)
  end

  describe '.initialize' do
    it "sets the name of the topping" do
      topping = Topping.new('olives')

      expect(topping.name).to eq('olives')
    end

    it 'sets whether or not the topping is vegetarian' do
      topping = Topping.new 'bell peppers', vegetarian: true

      expect(topping.vegetarian).to eq(true)
    end

  end

end
