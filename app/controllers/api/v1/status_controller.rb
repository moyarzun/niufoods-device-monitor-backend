class Api::V1::StatusController < ApplicationController
  before_action :set_api_v1_status, only: %i[show update destroy]

  # GET /api/v1/status
  def index
    @api_v1_status = Api::V1.status.all

    render json: @api_v1_status
  end

  # GET /api/v1/status/1
  def show
    render json: @api_v1_status
  end

  # POST /api/v1/status
  def create
    @api_v1_status = Api::V1.status.new(api_v1_status_params)

    if @api_v1_status.save
      render json: @api_v1_status, status: :created, location: @api_v1_status
    else
      render json: @api_v1_status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/status/1
  def update
    if @api_v1_status.update(api_v1_status_params)
      render json: @api_v1_status
    else
      render json: @api_v1_status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/status/1
  def destroy
    @api_v1_status.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_status
    @api_v1_status = Api::V1.status.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_v1_status_params
    params.fetch(:api_v1_status, {})
  end
end
