class Device < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :location
  has_many :status_logs
end
