class FlooringGem::CLI

  def call
    puts "Welcome to Craftsmen Floors!"
    site = 'https://themasterscraft.com/'
    scrape = Nokogiri::HTML(open(site))
    puts scrape
  end

end
