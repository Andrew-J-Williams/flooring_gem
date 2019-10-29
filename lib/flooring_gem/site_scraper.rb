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




end
