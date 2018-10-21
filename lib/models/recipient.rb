class Recipient < ActiveRecord::Base
  belongs_to :delivery_person
  belongs_to :post_office

def self.assign_random_post_office
  counter = PostOffice.all.count
  shuffle_array = [*1..counter]
      Recipient.find_each  do |recipient|
        recipient.post_office_id = shuffle_array.sample
        recipient.save
      end
end

def self.set_delivery_person
  DeliveryPerson.select do |delivery_person|
    Recipient.select do |recipient|
     delivery_person.post_office_id == recipient.post_office_id
       recipient.delivery_person_id = delivery_person.id
       recipient.save
     end
  end
end


def self.package_count(name)
  num = 0
  Recipient.all.find do |recipient|
    if recipient.name == name
      if recipient.deliveries_received != nil
         num = recipient.deliveries_received
         num+=1
        recipient.deliveries_received = num
        recipient.save
      else
        num = 0
        num+=1
        recipient.deliveries_received = num
        recipient.save
      end
    end
  end
end

def self.receive_delivery(recipient)
  name = recipient
  Recipient.all.find do |recipient|
    self == recipient.name
    name_of_worker = DeliveryPerson.get_name(recipient.delivery_person_id)
    puts ""
   puts "Thanks for the delivery #{name_of_worker}!"
   end
   Recipient.package_count(name)
end






end
