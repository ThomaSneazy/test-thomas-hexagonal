class AddWaitingListToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :waiting_position, :integer, default: 0
  end
end
