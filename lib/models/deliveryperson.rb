class DeliveryPerson < ActiveRecord::Base
  belongs_to :post_office
  belongs_to :recipient
end
