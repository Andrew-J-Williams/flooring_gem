class FlooringGem::SiteScraper

  def self.scrape_cities
    doc = Nokogiri::HTML(open('https://themasterscraft.com/contact/'))
    data = doc.css("h3")
    cities = []

    data.each do |city|
      name = city.text.strip
      FlooringGem::City.new(name)
    end
  end




end
