class StatusLog < ApplicationRecord
  validates :device_id, :status_id, presence: true
  validates :reported_at, presence: true
  validate :report_datetime_not_in_the_past

  belongs_to :device
  belongs_to :status

  after_save :update_location_status

  WARNING_LEVELS = %w[ok warning error]

  # Validación de que el StatusLog reportado no se encuentra en una fecha anterior a la del último reporte registrado para cada dispositivo
  def report_datetime_not_in_the_past
    last_report = StatusLog.where(device_id: device_id).maximum(:reported_at)
    return unless last_report && reported_at < last_report

    errors.add(:reported_at, 'no puede ser menor que la última fecha y hora registrada para este dispositivo')
  end

  private

  def update_location_status
    location = device.location
    return unless location

    # Obtener el último warning_level de cada status de device asociado a la location y calcular su status
    last_warning_levels = location.devices.joins(status_logs: :status)
                                  .select('devices.id, status.warning_level')
                                  .where('status_logs.reported_at = (SELECT MAX(reported_at) FROM status_logs WHERE device_id = devices.id)')
                                  .map(&:warning_level)
    location_status = calculate_location_status(last_warning_levels)

    location.update(status: location_status)
  end

  def calculate_location_status(warning_levels)
    WARNING_LEVELS[warning_levels.max] || 'N/A'
  end
end
