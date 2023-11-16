class CreateDonations < ActiveRecord::Migration[7.1]
  def change
    create_table :donations do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :amount

      t.timestamps
    end
  end
end
