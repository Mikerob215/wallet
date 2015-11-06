class User < ActiveRecord::Base
  # Associations
  has_many :shareds
  has_many :cards, through: :shareds

  # Validations
  validates :email, presence: true, uniqueness: true, length: {minimum: 14, maximum: 255}
  validates :password, presence: true, length: {minimum: 6}
  validates :phone_number, presence: true, length: {is: 10}, numericality: { only_integer: true }
  validates :fname, presence: true
  validates :lname, presence: true
  has_secure_password
end
