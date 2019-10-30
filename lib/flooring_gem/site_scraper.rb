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

  def self.scrape_products(city)
    doc = Nokogiri::HTML(open("https://schillings.com/product-category/flooring/hardwood/"))

    doc.css("ul.products li").each do |element|
      name = element.css("h2.woocommerce-loop-product__title").text.strip
      quantity = rand(500..1500).to_s + " sqft"
      price = element.css("span.wc-measurement-price-calculator-price").text.strip
      FlooringGem::Products.new(name, city, quantity, price)
    end
  end


end
