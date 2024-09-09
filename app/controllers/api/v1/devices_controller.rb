class Api::V1::DevicesController < ApplicationController
  before_action :set_api_v1_device, only: %i[show update destroy]

  # GET /api/v1/devices
  def index
    @api_v1_devices = Device.all

    render json: @api_v1_devices
  end

  # GET /api/v1/devices/1
  def show
    render json: @api_v1_device
  end

  # POST /api/v1/devices
  def create
    @api_v1_device = Device.new(api_v1_device_params)

    if @api_v1_device.save
      render json: @api_v1_device, status: :created, location: @api_v1_device
    else
      render json: @api_v1_device.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/devices/1
  def update
    if @api_v1_device.update(api_v1_device_params)
      render json: @api_v1_device
    else
      render json: @api_v1_device.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/devices/1
  def destroy
    @api_v1_device.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_device
    @api_v1_device = Device.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_v1_device_params
    params.fetch(:api_v1_device, {})
  end
end
