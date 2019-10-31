class FlooringGem::Contact

  attr_accessor :address, :city, :phone
  @@all = []

  def initialize(address, city, phone)
    @address = address
    @city = city
    @phone = phone

    create_contact_info
    @@all << self
  end

  def self.all
    @@all
  end

  def create_contact_info
    @city.contact << self unless @city.contact.include?(self)
  end


end
