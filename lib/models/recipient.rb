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





end
