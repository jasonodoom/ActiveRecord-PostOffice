class PostOffice < ActiveRecord::Base
  has_many :delivery_people
  has_many :recipients, through: :delivery_people

  def self.get_id(post_office_name)
    PostOffice.all.find_by(name: post_office_name).id
  end

  def self.get_name(post_office_id)
    PostOffice.all.find_by(id: post_office_id).name
  end

end
