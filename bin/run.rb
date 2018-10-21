require_relative '../config/environment'

$RAND_ASSIGN = PostOffice.all.sample.name # store randomg post office name in global var

def set_sex(sex)
  if sex.downcase == "m"
    delivery_person = "Delivery Man"
  elsif sex.downcase == "f"
    delivery_person = "Delivery Woman"
  else
    DeliveryPerson.all.last.delete
    puts "I can't let you do that #{postal_worker_name.split[0]}"
  end
end

def get_assignment
  DeliveryPerson.assignment
end

def configure
  puts "Please enter your name: "
  postal_worker_name = gets.chomp
  DeliveryPerson.create(name: postal_worker_name)

  puts "Male or Female? [m/f]"
  sex = gets.chomp
  get_sex = set_sex(sex)

  puts `clear` # clears the screen
  puts ""

  puts "Hello #{postal_worker_name.split[0]}!"
  puts "You're postal worker number: #{DeliveryPerson.get_id(postal_worker_name)}"

  rand_assign_id = PostOffice.find_by(name: $RAND_ASSIGN).id

  DeliveryPerson.find do |person|
    if  postal_worker_name == person.name
      person.post_office_id = rand_assign_id
      person.save
    end
  end

  puts ""

  puts "Today is your first day at the job as a #{get_sex}"
  puts "Please be sure to deliver mail only if the recipient is available!"

  puts ""
  rand_assign = $RAND_ASSIGN
  DeliveryPerson.assignment(rand_assign)
end

def reset
  DeliveryPerson.all.delete_all
  Recipient.all.delete_all
  PostOffice.all.delete_all
end

def menu
  puts " Menu:
      1) RESET
      2) PLAY GAME
      3) QUIT
      "

 puts "Please choose a menu option(1 2 3)"
 user_input = gets.chomp
  if user_input == "1" || user_input.downcase == "one"
     puts "You chose choice 1: RESET"
     puts "Continue?[y/n]"
     user_confirmation = gets.chomp
      if user_confirmation.downcase == "y"
          puts "Dropping all Delivery People from database....."
          puts "Dropping all Recipients from database....."
          puts "Dropping all Post Offices from database....."
          reset
      else
        menu
      end
  elsif user_input == "2"  || user_input.downcase == "two"
    configure
  elsif user_input == "3" || user_input.downcase == "three"
    puts "Goodbye!"
  else
    puts "Invalid input\n" + "GOODBYE\n"
  end
end

def loader
  puts "Welcome to Post Office"
   art = <<-EOS
      __________________
     |\                /|
     | \              / |
     | /\____________/\ |
     |/                \|
     |__________________|

     (  _ \/  \/ ___(_  _)   /  (  __(  __(  / __(  __)
      ) __(  O \___ \ )(    (  O ) _) ) _) )( (__ ) _)
     (__)  \__/(____/(__)    \__(__) (__) (__\___(____)
  EOS
  puts art
  puts ""
  puts "Get ready to delivery some mail!"
  puts "continue?[y/n]"
  user_input = gets.chomp
  if user_input.downcase == "y"
    configure
  elsif user_input.downcase == "n"
    menu
  else
    puts "Terminating...."
end

end

loader
