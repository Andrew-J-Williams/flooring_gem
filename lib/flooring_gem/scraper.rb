class FlooringGem::Scraper

  attr_reader :site

  def initialize
    @site = "https://themasterscraft.com"
  end

  def main_site
    doc = Nokogiri::HTML(open(site))
    puts doc
  end

  def city_names
    city_names = []
    doc = Nokogiri::HTML(open(site + "/contact/"))
    cities = doc.css("h3")

    cities.map do |name|
      city_names << name.text.strip
    end

    city_names

  end

end
