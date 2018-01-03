class Car < ApplicationRecord
  belongs_to :user
  validates :location,  presence: true, length: { maximum: 10 }
  validates :model,  presence: true, length: { maximum: 10 }
  validates :style,  presence: true
  validates :manufacturer,  presence: true, length: { maximum: 10 }
  validates :status,  presence: true
  validates :license_number,presence:true,length: {is:7},uniqueness: true,numericality: { only_integer: true }
  validates :rental_rate,  presence: true
end
