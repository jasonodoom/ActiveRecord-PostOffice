class DeliveryPerson < ActiveRecord::Base
  belongs_to :post_office
  belongs_to :recipient

 def self.get_id(postal_worker_name)
   DeliveryPerson.all.find_by(name: postal_worker_name).id
 end

 def self.get_name(postal_worker_id)
   DeliveryPerson.all.find_by(id: postal_worker_id).name
 end

 def self.assignment
   puts "Assigning you to a post office...."
   rand_assign = PostOffice.all.sample.name

   puts "You've been assigned to: #{rand_assign}"
  end

end
