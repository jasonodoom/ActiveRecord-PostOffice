class CreateRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipients do |t|
      t.integer  :delivery_person_id
      t.integer  :post_office_id
      t.string   :name
      t.boolean  :available, default: false
    end
  end
end
