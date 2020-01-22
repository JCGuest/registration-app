class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :address_type
      t.string :zip_code
      t.integer :user_id

      t.timestamps
    end
  end
end
