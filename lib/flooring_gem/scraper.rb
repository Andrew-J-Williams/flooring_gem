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
    doc = Nokogiri::HTML(open(site + "/contact/"))
    city_names = doc.css("h3").text
    puts city_names
  end

end
