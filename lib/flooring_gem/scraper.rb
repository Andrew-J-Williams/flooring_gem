class FlooringGem::Scraper

  def main_site
    doc = Nokogiri::HTML(open("https://themasterscraft.com"))
    puts doc
  end

  def 

end
