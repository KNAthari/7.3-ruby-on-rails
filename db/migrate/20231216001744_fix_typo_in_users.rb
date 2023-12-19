class FixTypoInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :unconfimred_email, :unconfirmed_email
  end
end
