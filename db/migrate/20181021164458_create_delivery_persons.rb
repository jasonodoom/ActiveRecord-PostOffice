class CreateDeliveryPersons < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_people do |t|
      t.integer  :post_office_id
      t.integer  :recipient_id
      t.string   :name
    end
  end
end
