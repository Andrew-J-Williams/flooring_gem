class FlooringGem::Products

  attr_accessor :name, :city, :quantity, :price
  @@all = []

  def initialize(name, city, quantity, price)
    @name = name
    @city = city
    @quantity = quantity
    @price = price

    add_to_location
    @@all << self
  end

  def self.all
    @@all
  end

  def add_to_location
    @city.inventory << self unless @city.inventory.include?(self)
  end

end
