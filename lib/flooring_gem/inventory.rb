class FlooringGem::Inventory

  attr_reader :name, :products

  @@all = {}
  @@title = {}

  def initialize
    @name = FlooringGem::Scraper.new.city_names
    @products = FlooringGem::Scraper.new.products
  end

  def create_records
    @name.each do |name|
      @@all[name] = self.all_products
    end
    @@all
  end

  def all
    @@all
  end

  def all_products
    @products.each do |name|
      @@title[name] = rand(10..1000).to_s + " sqft"
    end
    @@title
  end
end
