class Request < ApplicationRecord
  belongs_to :user
  belongs_to :desk
  validates :status, presence: true, inclusion: { in: %w(unconfirmed confirmed accepted expried),
    message: "Not a valid status" }
end
