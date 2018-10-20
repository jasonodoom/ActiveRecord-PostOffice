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

 def self.find_recipients(rand_assign)
   postal_id = PostOffice.get_id(rand_assign)
   deliveries = Recipient.all.find_by(post_office_id: postal_id).name
   puts "You have deliveries for: #{deliveries}\n"
 end

 def self.assignment(rand_assign)
   puts "Assigning you to a post office...."
   # rand_assign = PostOffice.all.sample.name
   # rand_assign = PostOffice.all.sample.name
   puts "You've been assigned to: #{rand_assign}"
   puts ""
   puts ""
   Recipient.assign_random_post_office # assign random post office to recipients so worker can deliver
   find_recipients(rand_assign)
   # PostOffice.all.find_by(name: post_office_name).id
  end

 end
