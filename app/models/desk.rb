class Desk < ApplicationRecord
  validates :name, presence: true
  has_many :resquests
end
