class Api::V1::StatusLogsController < ApplicationController
  before_action :set_api_v1_status_log, only: [:show, :update, :destroy]

  # GET /api/v1/status_logs
  def index
    @api_v1_status_logs = Api::V1::StatusLog.all

    render json: @api_v1_status_logs
  end

  # GET /api/v1/status_logs/1
  def show
    render json: @api_v1_status_log
  end

  # POST /api/v1/status_logs
  def create
    @api_v1_status_log = Api::V1::StatusLog.new(api_v1_status_log_params)

    if @api_v1_status_log.save
      render json: @api_v1_status_log, status: :created, location: @api_v1_status_log
    else
      render json: @api_v1_status_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/status_logs/1
  def update
    if @api_v1_status_log.update(api_v1_status_log_params)
      render json: @api_v1_status_log
    else
      render json: @api_v1_status_log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/status_logs/1
  def destroy
    @api_v1_status_log.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_status_log
      @api_v1_status_log = Api::V1::StatusLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_status_log_params
      params.fetch(:api_v1_status_log, {})
    end
end
