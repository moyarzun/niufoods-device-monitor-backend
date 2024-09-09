class Api::V1::StatusLogsController < ApplicationController
  before_action :set_status_log, only: %i[show update destroy]

  # GET /api/v1/status_logs
  def index
    @status_logs = StatusLog.all

    render json: @status_logs
  end

  # GET /api/v1/status_logs/1
  def show
    @status_log = StatusLog.joins(:status)
                           .select('status_logs.id, status_logs.reported_at, status.name as status')
                           .find(params[:id])

    render json: {
      id: @status_log.id,
      reported_at: @status_log.reported_at.in_time_zone.strftime('%Y-%m-%d %H:%M:%S'),
      status: @status_log.status
    }
  end

  # GET /api/v1/devices/:id/status_logs
  def by_device
    @status_logs = StatusLog.joins(:status)
                            .select('status_logs.id, status_logs.reported_at, status.name as status_name')
                            .where(device_id: params[:id])

    render json: @status_logs.map { |log|
                   { id: log.id,
                     reported_at: log.reported_at.in_time_zone.strftime('%Y-%m-%d %H:%M:%S'),
                     status: log.status_name }
                 }
  end

  # POST /api/v1/status_logs
  def create
    @status_log = StatusLog.new(status_log_params)
    @status_log.reported_at = Time.now

    if @status_log.save
      render json: @status_log, status: :created
    else
      render json: @status_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/status_logs/1
  def update
    if @status_log.update(status_log_params)
      render json: @status_log
    else
      render json: @status_log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/status_logs/1
  def destroy
    @status_log.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_status_log
    @status_log = StatusLog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def status_log_params
    params.require(:status_log).permit(:device_id, :status_id)
  end
end
