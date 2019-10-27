class FlooringGem::Scraper

  attr_reader :floor_site, :product_site

  def initialize
    @floor_site = "https://themasterscraft.com"
    @product_site = "https://www.lumberliquidators.com/ll/s/hardwood-flooring"
  end

  def main_site
    doc = Nokogiri::HTML(open(floor_site))
    puts doc
  end

  def city_names
    city_names = []
    doc = Nokogiri::HTML(open(floor_site + "/contact/"))
    cities = doc.css("h3")

    cities.map do |name|
        city_names << name.text.strip
    end

    city_names.delete("\u00A0")
    city_names.delete("")
    city_names
  end

  def products
    product_names = []
    doc = Nokogiri::HTML(open(product_site))
    products = doc.css("span.name-span")

    products.map do |name|
      product_names << name.text.strip
    end

    product_names

  end

end
