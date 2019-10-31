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

  def self.scrape_contact(city)
    url = 'https://themasterscraft.com/contact/'

    if city.name != "Denver"
      if city.name == "Cedar Rapids" || city.name == "Oklahoma City"
        city_name = city.name.sub!(" ", "-")
      elsif city.name == "West Plains"
        city_name = city.name.sub(" Plains", "Plains")
      elsif city.name == "St. Louis"
        city_name = city.name.sub!(". Louis", "Louis")
      elsif city.name == "NW Arkansas"
        city_name = city.name.sub!(" Arkansas", "Arkansas")
      elsif city.name == "Kansas City"
        puts "Website is currently down for #{city.name} location. Apologies."
      else
        city_name = city.name
      end

      doc = Nokogiri::HTML(open(url + "/#{city_name}/"))
      scrape = doc.css("div.builder-text-content p").text.strip

      a = "4pm"
      b = "Get"
      c = " "
      d = "CONTACT"

      address = "#{scrape[/#{a}(.*?)#{b}/m, 1]}"
      phone = "#{scrape[/#{c}(.*?)#{d}/m, 1]}"

      FlooringGem::Contact.new(address, city, phone)
    else
      city_name = city.name

      doc = Nokogiri::HTML(open(url + "/#{city_name}/"))
      scrape = doc.css("div.builder-text-content p").text.strip

      a = " "
      b = "90 "
      c = "3"
      d = " Directions"

      address = "#{scrape[/#{a}(.*?)#{b}/m, 1]}"
      phone = "#{scrape[/#{c}(.*?)#{d}/m, 1]}"

      FlooringGem::Contact.new(address, city, phone)
    end
  end

end
