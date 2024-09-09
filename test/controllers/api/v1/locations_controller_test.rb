require "test_helper"

class Api::V1::LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_location = api_v1_locations(:one)
  end

  test "should get index" do
    get api_v1_locations_url, as: :json
    assert_response :success
  end

  test "should create api_v1_location" do
    assert_difference('Api::V1::Location.count') do
      post api_v1_locations_url, params: { api_v1_location: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_location" do
    get api_v1_location_url(@api_v1_location), as: :json
    assert_response :success
  end

  test "should update api_v1_location" do
    patch api_v1_location_url(@api_v1_location), params: { api_v1_location: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_location" do
    assert_difference('Api::V1::Location.count', -1) do
      delete api_v1_location_url(@api_v1_location), as: :json
    end

    assert_response 204
  end
end
