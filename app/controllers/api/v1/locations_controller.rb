class Api::V1::LocationsController < ApplicationController
  before_action :set_api_v1_location, only: %i[show update destroy]

  # GET /api/v1/locations
  def index
    @api_v1_locations = Location.all

    render json: @api_v1_locations
  end

  # GET /api/v1/locations/1
  def show
    render json: @api_v1_location
  end

  # POST /api/v1/locations
  def create
    @api_v1_location = Location.new(api_v1_location_params)

    if @api_v1_location.save
      render json: @api_v1_location, status: :created, location: @api_v1_location
    else
      render json: @api_v1_location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/locations/1
  def update
    if @api_v1_location.update(api_v1_location_params)
      render json: @api_v1_location
    else
      render json: @api_v1_location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/locations/1
  def destroy
    @api_v1_location.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_location
    @api_v1_location = Location.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_v1_location_params
    params.fetch(:api_v1_location, {})
  end
end
