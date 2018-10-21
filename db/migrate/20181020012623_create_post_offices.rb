class CreatePostOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :post_offices do |t|
      t.integer  :post_office_id
      t.string   :name
    end
  end
end
