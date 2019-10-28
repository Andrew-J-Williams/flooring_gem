class FlooringGem::CLI

  def call
    puts ""
    puts "Welcome to Craftsmen Floors!"
    puts ""
    menu
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
