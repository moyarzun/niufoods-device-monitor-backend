class StatusLog < ApplicationRecord
  validates :device_id, :status_id, presence: true
  validates :reported_at, presence: true
  validate :report_datetime_not_in_the_past

  belongs_to :device
  belongs_to :status

  # Validación de que el StatusLog reportado no se encuentra en una fecha anterior a la del último reporte registrado para cada dispositivo
  def report_datetime_not_in_the_past
    last_report = StatusLog.where(device_id: device_id).maximum(:reported_at)
    return unless last_report && reported_at < last_report

    errors.add(:reported_at, 'no puede ser menor que la última fecha y hora registrada para este dispositivo')
  end
end
