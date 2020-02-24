class Bicycle < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  belongs_to :user
  validates :title, presence: true
  validates :size, presence: true
  validates :style, presence: true
  validates :location, presence: true
  validates :price, presence: true, numericality: true
end
