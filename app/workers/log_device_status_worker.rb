class LogDeviceStatusWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(device_id, status_id, reported_at)
    StatusLog.create!(device_id: device_id,
                      status_id: status_id,
                      reported_at: reported_at)
  end
end
