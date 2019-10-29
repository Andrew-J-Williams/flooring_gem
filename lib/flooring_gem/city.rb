class FlooringGem::City

  attr_accessor :name, :inventory
  @@all = []

  def initialize(name)
    @name = name
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

end
