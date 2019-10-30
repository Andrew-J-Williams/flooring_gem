class FlooringGem::CLI

  def call
    puts ""
    puts "Welcome to Craftsmen Floors! Your one-stop shop for all things hardwood."
    puts ""

    while @user_choice != 'exit' || @user_choice != 'Exit'
      cities
      cities_list
      user_selection
      repeat?
    end
  end

  def cities
    @city = FlooringGem::City.all
  end

  def cities_list
    puts "We have 12 locations across the United States, as seen below:"
    @city.each.with_index(1) do |city, index|
      puts "#{index}. #{city.name}"
    end

    puts ""
    puts "To view a store's inventory, enter the number next to the city name: "
  end

  def user_selection
   city_choice = gets.strip.to_i

   if city_choice > @city.length
     puts ""
     puts "Sorry, but you entered #{city_choice}. We only have 12 locations. Please enter a different value to continue: "
     user_selection
   elsif city_choice <= 0
     puts ""
     puts "Let's stay positive here! Try entering another number greater than 0 to continue:"
     user_selection
   else
      show_inventory_for(city_choice)
   end
  end

  def show_inventory_for(city_choice)
    city = @city[city_choice - 1]
    city.check_inventory
    puts ""
    puts "Below is an inventory count for our #{city.name} store. Pricing is listed in paratheses: "
    city.inventory.each.with_index(1) do |product, index|
      puts "#{index}. #{product.name} - #{product.quantity} (#{product.price})"
    end

    puts ""
  end

  def repeat?
    puts "To view another city's inventory, press any key."
    puts "To close this program, enter 'exit'."
    @user_choice = gets.strip
    puts ""
  end

  def farewell
    puts "Stop by again sometime soon!"
  end
