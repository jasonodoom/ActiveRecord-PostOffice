class Recipient < ActiveRecord::Base
  belongs_to :delivery_person
  belongs_to :post_office
end
