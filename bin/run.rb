def set_sex(sex)
  if sex.downcase == "m"
    delivery_person = "Delivery Man"
  elsif sex.downcase == "f"
    delivery_person = "Delivery Woman"
  else
    puts "I can't let you do that #{username.split[0]}"
  end
end

def configure
  puts "Please enter your name: "
  username = gets.chomp
  DeliveryPerson.create(name: username)

  puts "Male or Female? [M/F]"
  sex = gets.chomp
  get_sex = set_sex(sex)

  puts `clear` # clears the screen

  puts "Hello #{username.split[0]}!"
  puts ""
  puts "Today is your first day at the job as a #{get_sex}"
  puts "Please be sure to deliver mail only if the recipient is available!"
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
configure
end

puts loader
