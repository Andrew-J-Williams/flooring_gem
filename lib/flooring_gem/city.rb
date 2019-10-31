class FlooringGem::City

  attr_accessor :name, :inventory, :contact
  @@all = []

  def initialize(name)
    @name = name
    @contact = []
    @inventory = []
    @@all << self
  end

  def self.all
    FlooringGem::SiteScraper.scrape_cities if @@all.empty?
    @@all
  end

  def check_inventory
    FlooringGem::SiteScraper.scrape_products(self) if @inventory.empty?
  end

  def get_contact_info
    FlooringGem::SiteScraper.scrape_contact(self) if @contact.empty?
  end

end
