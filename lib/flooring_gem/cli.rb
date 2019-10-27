class FlooringGem::CLI

  def call
    puts "Welcome to Craftsmen Floors!"
    puts ""
    site = Nokogiri::HTML(open(https://themasterscraft.com))
    puts site

  end

end
