class FlooringGem::CLI

  def call
    puts ""
    puts "Welcome to Craftsmen Floors!"
    puts ""
    get_cities
    list_cities
    get_user_city
  end

  def get_cities
    @city = FlooringGem::City.all
  end

  def list_cities
    puts 'Choose a city to see inventory.'
    @city.each.with_index(1) do |city, index|
      puts "#{index}. #{city.name}"
    end
  end

  def get_user_city
   chosen_city = gets.strip.to_i
   show_inventory_for(chosen_city) if valid_input(chosen_city, @city)
 end

 def valid_input(input, data)
   input.to_i <= data.length && input.to_i > 0
 end

  def show_inventory_for(chosen_city)
    city = @city[chosen_city - 1]
    city.check_inventory
    puts "Here are products for #{city.name}"
    city.inventory.each.with_index(1) do |product, idx|
      puts "#{idx}. #{product.name}"
    end

  end



  def menu
    puts ""
    puts "Wood Flooring Resources:"
    puts ""
    puts "1. Check Store Inventory"
    puts "2. Installation Guides"
    puts "3. Calculate Square Footage"
    puts "4. Contact a Store"
    puts ""
    puts "Enter the number of the resource(1-4) you wish to access, or type 'exit' to close the program: "
    user_choice = gets.strip

    if user_choice == 'exit' || user_choice == 'Exit'
      puts ""
      puts "Thanks for visiting! Come back soon!"
      exit
    elsif user_choice.to_i == 1
      choose_city
    else
      puts ""
      puts "I'm sorry, that was an invalid selection. Please try again."
      puts ""
      menu
    end

  end

  def choose_city
      FlooringGem::Inventory.new.find_products

      puts ""
      puts "Scroll up to see the results for your inventory search."
      puts "Do you wish to search again? (Y/N):"

      while user_choice = gets.strip
        if user_choice == "Y" || user_choice == "y"
          choose_city
        elsif user_choice == "N" || user_choice == "n"
          break
        else
          puts "Sorry, that's not an option! Try again."
        end
      end
      menu
  end


end
