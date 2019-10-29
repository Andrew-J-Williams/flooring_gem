class FlooringGem::Products

  attr_accessor :name, :city, :quantity, :price
  @@all = []

  def initialize(name, city, quantity, price)
    @name = name
    @city = city
    @quantity = quantity
    @price = price

    @@all << self
  end

  def self.all
    @@all
  end

end
