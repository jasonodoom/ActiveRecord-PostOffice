class DeliveryPerson < ActiveRecord::Base
  belongs_to :post_office
  belongs_to :recipient

 def self.get_id(postal_worker_name)
   DeliveryPerson.all.find_by(name: postal_worker_name).id
 end

 def self.get_name(postal_worker_id)
   DeliveryPerson.all.find_by(id: postal_worker_id).name
 end

 def self.assignment(rand_assign)
   puts "Assigning you to a post office...."

   puts "You've been assigned to: #{rand_assign}"
   puts ""
   puts ""
   Recipient.assign_random_post_office # assign random post office to recipients so worker can deliver
   find_recipients
  end

  def self.find_recipients
    Recipient.all.select do |recipient|
      postal_id = PostOffice.get_id($RAND_ASSIGN)
       recipient.post_office_id == postal_id
      end
      puts "You have deliveries for: #{recipient.name}\n"
    end
  end





end
