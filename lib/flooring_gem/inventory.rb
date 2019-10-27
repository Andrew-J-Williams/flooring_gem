class FlooringGem::Inventory

  attr_reader :name

  @@all = {}

  def initialize
    @name = FlooringGem::Scraper.new.city_names
  end

  def create_records
    @name.each do |name|
      @@all[name] = "test"
    end


    #@@all[@name[0]] = "empty"
    #@@all[@name[1]] = "testing"
    #@@all[@name[2]] = "this"

    @@all
  end

end
