class Api::V1::DevicesController < ApplicationController
  before_action :set_device, only: %i[show update destroy]

  # GET /api/v1/devices
  def index
    @devices = Device.all

    render json: @devices
  end

  # GET /api/v1/devices/1
  def show
    @device = Device.includes(:status_logs).find(params[:id])
    current_status = @device.status_logs.order(reported_at: :desc).first

    render json: @device.as_json.merge(current_status: current_status&.status&.name)
  end

  # GET /api/v1/locations/:id/devices
  def by_location
    @devices = Device.includes(:status_logs).where(location_id: params[:id])

    devices_with_current_status = @devices.map do |device|
      current_status = device.status_logs.order(reported_at: :desc).first
      device.as_json.merge(current_status: current_status&.status&.name)
    end

    render json: devices_with_current_status
  end

  # POST /api/v1/devices
  def create
    @device = Device.new(device_params)

    if @device.save
      render json: @device, status: :created
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/devices/1
  def update
    if @device.update(device_params)
      render json: @device
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/devices/1
  def destroy
    @device.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_device
    @device = Device.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def device_params
    params.require(:device).permit(:location_id, :name)
  end
end
