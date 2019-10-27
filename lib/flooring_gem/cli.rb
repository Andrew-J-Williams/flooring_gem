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
    user_choice = gets.strip

    if user_choice == 'exit' || user_choice == 'Exit'
      puts "Thanks for visiting! Come back soon!"
      exit
    elsif user_choice.to_i == 1
      puts "Which store are you interested in?"
    else
      puts ""
      puts "I'm sorry, that was an invalid selection. Please try again."
      puts ""
      menu
    end

  end


end
