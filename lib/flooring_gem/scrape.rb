class FlooringGem::Scrape

  def self.scrape_site
    doc = Nokogiri::HTML(open("https://themasterscraft.com"))
    binding.pry
  end

end
