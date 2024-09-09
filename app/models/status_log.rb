class StatusLog < ApplicationRecord
  validates :device_id, :status_id, presence: true
  validates :reported_at, presence: true

  belongs_to :device
  belongs_to :status
end
