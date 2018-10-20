class DeliveryPerson < ActiveRecord::Base
  belongs_to :post_office
  belongs_to :recipient

 rand_assign = $RAND_ASSIGN

 def self.get_id(postal_worker_name)
   DeliveryPerson.all.find_by(name: postal_worker_name).id
 end

 def self.get_name(postal_worker_id)
   DeliveryPerson.all.find_by(id: postal_worker_id).name
 end

def self.delivery(recipient)
  if Recipient.all.find_by(name: recipient).available == false
    puts "However, #{recipient} is not available to receive your delivery."
  else
    Recipient.receive_delivery(recipient)
  end
end

def assign_delivery_person_id
  Recipient.all.select do |recipient|
    personal_id = DeliveryPerson.get_id(self)
    recipient.delivery_person_id =  personal_id
    recipient.save
  end
end


 def self.find_recipients(rand_assign)
   postal_id = PostOffice.get_id(rand_assign)
   deliveries = Recipient.all.find_by(post_office_id: postal_id).name
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
