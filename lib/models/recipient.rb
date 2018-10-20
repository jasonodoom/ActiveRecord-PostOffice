class Recipient < ActiveRecord::Base
  belongs_to :delivery_person
  belongs_to :post_office

def self.assign_random_post_office
  counter = Recipient.all.count
  shuffle_array = [*1..counter]
      Recipient.find_each  do |recipient|
        recipient.post_office_id = shuffle_array.sample
        recipient.save
        end
end

def self.receive_delivery(recipient)
  Recipient.all.find do |recipient|
    self == receiver.name
    name_of_worker = DeliveryPerson.get_name(delivery_person_id)
    puts "Thanks for the delivery #{name_of_worker}!"
   end
end






end
