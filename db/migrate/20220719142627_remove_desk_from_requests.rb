class RemoveDeskFromRequests < ActiveRecord::Migration[6.1]
  def change
    remove_reference :requests, :desk, null: false, foreign_key: true
    remove_reference :requests, :user, null: false, foreign_key: true
  end
end
