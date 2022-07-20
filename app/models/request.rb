class Request < ApplicationRecord
  # belongs_to :user
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, :phone_number, :biography, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, format: { with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/ }
  # validates :status, presence: true, inclusion: { in: %w(unconfirmed confirmed accepted expried),
  #   message: "Not a valid status" }
  after_create :send_welcome_email

  private

  def send_welcome_email
    RequestMailer.with(request: self).create_confirmation.deliver_now
  end
end
