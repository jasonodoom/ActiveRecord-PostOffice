class CreatePostOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :post_offices do |t|
      t.string   :name
    end
  end
end
