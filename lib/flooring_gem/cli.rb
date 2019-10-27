class FlooringGem::CLI

  def call
    puts ""
    puts "Welcome to Craftsmen Floors!"
    puts ""
    menu
  end

  def menu
    puts "Wood Flooring Resources:"
    puts ""
    puts "1. Check Store Inventory"
    puts "2. Installation Guides"
    puts "3. Calculate Square Footage"
    puts "4. Contact a Store"
    puts ""
    puts "Enter the number of the resource(1-4) you wish to access, or type 'exit' to close the program: "
  end


end
