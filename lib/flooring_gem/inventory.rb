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

  def find_products
    data = self.create_records
    puts ""
    puts "Enter the name of the store's city to view stock:"
    city = gets.strip

    data_hash = data[city]

    if data_hash != nil
      data_hash.each do |key, value|
        puts ""
        puts "#{key}: #{value}"
      end
    else
      puts ""
      puts "Sorry, we do not have a store at this location."
      find_products
    end

  end

end
