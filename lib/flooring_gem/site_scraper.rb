class FlooringGem::SiteScraper

  @a = "4pm"
  @b = "Get"
  @c = " "
  @d = "CONTACT"
  @e = " "
  @f = "90 "
  @g = "3"
  @h = "Get"

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

    case city.name
    when "Denver"
      city_name = city.name

      doc = Nokogiri::HTML(open(url + "/#{city_name}/"))
      scrape = doc.css("div.builder-text-content p").text.strip

      address = "#{scrape[/#{@g}(.*?)#{@h}/m, 1]}"
      phone = "#{scrape[/#{@e}(.*?)#{@f}/m, 1]}"

      FlooringGem::Contact.new(address.sub!("BlvdDenver", "Blvd Denver"), city, phone)

    when "Austin"
      city_name = city.name

      doc = Nokogiri::HTML(open(url + "/#{city_name}/"))
      scrape = doc.css("div.builder-text-content p").text.strip

      address = "#{scrape[/#{@a}(.*?)#{@b}/m, 1]}"
      phone = "#{scrape[/#{@c}(.*?)#{@d}/m, 1]}"

      FlooringGem::Contact.new(address.sub!("BlvdAustin", "Blvd Austin"), city, phone)

    when "Cedar Rapids"
      city_name = city.name.sub!(" ", "-")

      doc = Nokogiri::HTML(open(url + "/#{city_name}/"))
      scrape = doc.css("div.builder-text-content p").text.strip

      address = "#{scrape[/#{@a}(.*?)#{@b}/m, 1]}"
      phone = "#{scrape[/#{@c}(.*?)#{@d}/m, 1]}"

      FlooringGem::Contact.new(address.sub!("SWCedar", "SW Cedar"), city, phone)

    when "NW Arkansas"
      city_name = city.name.sub!(" Arkansas", "Arkansas")

      doc = Nokogiri::HTML(open(url + "/#{city_name}/"))
      scrape = doc.css("div.builder-text-content p").text.strip

      address = "#{scrape[/#{@a}(.*?)#{@b}/m, 1]}"
      phone = "#{scrape[/#{@c}(.*?)#{@d}/m, 1]}"

      FlooringGem::Contact.new(address.sub!("StreetBethel", "Street Bethel"), city, phone)

    when "Oklahoma City"
      city_name = city.name.sub!(" ", "-")

      doc = Nokogiri::HTML(open(url + "/#{city_name}/"))
      scrape = doc.css("div.builder-text-content p").text.strip

      address = "#{scrape[/#{@a}(.*?)#{@b}/m, 1]}"
      phone = "#{scrape[/#{@c}(.*?)#{@d}/m, 1]}"

      FlooringGem::Contact.new(address.sub!("StreetOklahoma", "Street Oklahoma"), city, phone)

    else

      case city.name
      when "West Plains"
        city_name = city.name.sub!(" Plains", "Plains")
      when "St. Louis"
        city_name = city.name.sub!(". Louis", "Louis")
      when "Kansas City"
        puts ""
        puts "Website is currently down for #{city.name} location. Cannot display contact information!"
        puts ""
      else
        city_name = city.name
      end

      doc = Nokogiri::HTML(open(url + "/#{city_name}/"))
      scrape = doc.css("div.builder-text-content p").text.strip

      address = "#{scrape[/#{@a}(.*?)#{@b}/m, 1]}"
      phone = "#{scrape[/#{@c}(.*?)#{@d}/m, 1]}"

      FlooringGem::Contact.new(address, city, phone)

    end
  end


end
