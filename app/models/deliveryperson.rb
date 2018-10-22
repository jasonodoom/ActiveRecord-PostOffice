class DeliveryPerson < ActiveRecord::Base
  belongs_to :post_office
  belongs_to :recipient

  rand_assign = $RAND_ASSIGN

 def self.get_id(postal_worker_name)
   DeliveryPerson.find_by(name: postal_worker_name).id
 end

 def self.get_name(postal_worker_id)
   DeliveryPerson.find(postal_worker_id).name
 end

  def self.take_a_break
    options = ["a break", "relaxation", "breakfast", "dinner", " a nap"]
    options.sample
  end

 def self.redeliver(recipient)
   puts "You leave #{recipient}'s address and return to #{$RAND_ASSIGN} for #{DeliveryPerson.take_a_break}."
   puts "When you return an hour later..."
   puts ".............................................................."
   puts "...................................................."
   puts "..............................................."
   puts "........................................."
   Recipient.find do |recipient|
     recipient == recipient.name
     recipient.available = true
     recipient.save
   end
   puts "#{recipient} is home."
   Recipient.receive_delivery(recipient)
 end


def self.new_delivery
   recipient = Recipient.all.sample.name
   puts" You'll be delivering to #{recipient}."
   DeliveryPerson.delivery(recipient)
end


def self.delivery(recipient)
  if Recipient.find_by(name: recipient).available == false
    puts "However, #{recipient} is not available to receive your delivery."
    puts "Would you like to try again later?[y/n]"
    response = gets.chomp
      if response.downcase == "y"
        puts `clear`
        self.redeliver(recipient)
      else
        self.new_delivery
      end
    else
       Recipient.receive_delivery(recipient)
    end
end

def assign_delivery_person_id
  Recipient.select do |recipient|
    personal_id = DeliveryPerson.get_id(self)
    recipient.delivery_person_id =  personal_id
    recipient.save
  end
end

 def self.find_recipients(rand_assign)
   postal_id = Recipient.all.sample.id
   deliveries = Recipient.find(postal_id)["name"] # get name of recipients that we've deliveries for
   Recipient.find  do |recipient|
     DeliveryPerson.find do |delivery_person|
     delivery_person.id == recipient.delivery_person_id
      delivery_person.recipient_id = recipient.id
      delivery_person.save
    end
   end
   Recipient.set_delivery_person
   puts "You have deliveries for: #{deliveries}\n"
   recipient = deliveries
   DeliveryPerson.delivery(recipient)
 end

 def self.assignment(rand_assign)
   puts "Assigning you to a post office...."
   puts "You've been assigned to: #{rand_assign}"
   puts ""
   puts ""
   Recipient.assign_random_post_office # assign random post office to recipients so worker can deliver
   DeliveryPerson.find_recipients(rand_assign)
  end

 end
