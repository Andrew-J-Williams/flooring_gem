class FlooringGem::City

  attr_accessor :name, :inventory
  @@all = []

  def initialize(name)
    @name = name
    @inventory = []
    @@all << self
  end

  def self.all
    @@all
  end

  def get_locations

  end


end
