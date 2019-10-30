class FlooringGem::Products

  attr_accessor :name, :city, :quantity, :price
  @@all = []

  def initialize(name, city, quantity, price)
    @name = name
    @city = city
    @quantity = quantity
    @price = price

    create_inventory
    @@all << self
  end

  def self.all
    @@all
  end

  def create_inventory
    @city.inventory << self unless @city.inventory.include?(self)
  end

end
