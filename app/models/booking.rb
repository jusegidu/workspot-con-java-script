require 'date'

class Booking < ApplicationRecord
  belongs_to :place
  belongs_to :user
  validates :check_in, :check_out, presence: true
  validates :check_out, comparison: { greater_than: :check_in }
  validates :check_in, comparison: { greater_than: Date.today }
end
