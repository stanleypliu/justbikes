class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :bicycles
  validates :name, presence: true

  def booked_bicycles
    bicycles.map { |b| b.bookings }.flatten
  end
end
