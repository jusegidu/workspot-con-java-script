class Place < ApplicationRecord
  has_one_attached :photo
  has_many :bookings
  belongs_to :user
  validates :name, :address, :city, :price, presence: true
  validates :price, numericality: { only_integer: true }
  # validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  alias_attribute :nation, :country
end
