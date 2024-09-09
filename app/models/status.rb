class Status < ApplicationRecord
  self.table_name = 'status'
  validates :name, presence: true, uniqueness: true

  has_many :status_logs
end
