class FlooringGem::Contact

  attr_accessor :address, :city, :phone
  @@all = []

  def initialize(address, city, phone)
    @address = address
    @city = city
    @phone = phone

    @@all << self
  end

  def self.all
    @@all
  end

  

end
