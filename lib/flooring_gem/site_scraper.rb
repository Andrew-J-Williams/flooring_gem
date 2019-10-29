class FlooringGem::SiteScraper

  def self.scrape_cities
    doc = Nokogiri::HTML(open('https://themasterscraft.com/contact/'))
    data = doc.css("h3")
    cities = []

    data.each do |city|
      name = city.text.strip
      cities << name
    end

    cities.delete("\u00A0")
    cities.delete("")

    cities.each do |name|
        FlooringGem::City.new(name)
    end

  end

  def self.scrape_products
    doc = Nokogiri::HTML(open("https://www.lumberliquidators.com/ll/s/hardwood-flooring"))
    product_array = []

    data.each do |name|
      product_array << name.text.strip
    end
    product_array

  end


end
