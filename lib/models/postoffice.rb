class PostOffice < ActiveRecord::Base
  has_many :delivery_persons
  has_many :recipients, through: :delivery_persons
end
