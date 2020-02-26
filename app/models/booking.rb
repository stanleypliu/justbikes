class Booking < ApplicationRecord
  belongs_to :bicycle
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  before_save :set_price

  def set_price
    self.total_price = (end_date - start_date).to_i * bicycle.price
  end
end
