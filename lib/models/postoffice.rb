class PostOffice < ActiveRecord::Base
  has_many :delivery_people
  has_many :recipients, through: :delivery_people
end
