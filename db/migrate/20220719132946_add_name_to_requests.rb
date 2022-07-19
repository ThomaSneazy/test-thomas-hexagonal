class AddNameToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :name, :string
    add_column :requests, :email, :string
    add_column :requests, :phone_number, :string
    add_column :requests, :biography, :text
  end
end
