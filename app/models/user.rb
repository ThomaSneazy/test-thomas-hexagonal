class User < ApplicationRecord
  # protected

  # def confirmation_required?
  #   false
  # end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
        #  validates :name, presence: true, length: { maximum: 50 }
        #  validates :email, :phone_number, :biography, presence: true
        #  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
        #  validates :phone_number, format: { with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/ }
end
