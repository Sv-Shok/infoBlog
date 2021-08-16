class AddFirstNameColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :firstName, :string
  end
end
