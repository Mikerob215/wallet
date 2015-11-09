class Card < ActiveRecord::Base
  before_save :type_of_card
  # Associations
  has_many :shareds
  has_many :users, through: :shareds

  # Validations
  validates :number, presence: true, length: {is: 16}, numericality: {only_integer: true}
  validates :expmonth, presence: true, length: {is: 2}, numericality: {only_integer: true, greater_than: 0, less_than: 13}
  validates :expyear, presence: true, length: {is: 4}, numericality: {only_integer: true, greater_than: 2014}
  validates :balance, presence: true, numericality: {only_integer: true, greater_than: 0}

  # Callbacks
  def type_of_card
    first_digit = self.number[0].to_i
    if first_digit == 4
      self.kind = "Visa"
    elsif first_digit == 5
      self.kind = "Mastercard"
    elsif first_digit == 3
      self.kind = "American Express"
    elsif first_digit == 6
      self.kind = "Discover"
    else
      errors.add(:number, "not a valid credit card number")
      return false
    end
  end

end
