class Bicycle < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews # added has_many to bicycles
  belongs_to :user
  validates :title, presence: true
  validates :size, presence: true
  validates :style, presence: true
  validates :location, presence: true
  validates :price, presence: true, numericality: true
  has_one_attached :photo # for cloudinary
  geocoded_by :location # location field is geocoding bicycle
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
   # pg_search_scope :search_by_location_and_size,
   pg_search_scope :search_by_location,
    against: [:location, :size],
    using: {
      tsearch: { prefix: true } # allows matching of even partial terms
    }
end
