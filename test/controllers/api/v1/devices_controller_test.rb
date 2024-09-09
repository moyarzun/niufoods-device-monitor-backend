require "test_helper"

class Api::V1::DevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_device = api_v1_devices(:one)
  end

  test "should get index" do
    get api_v1_devices_url, as: :json
    assert_response :success
  end

  test "should create api_v1_device" do
    assert_difference('Api::V1::Device.count') do
      post api_v1_devices_url, params: { api_v1_device: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_device" do
    get api_v1_device_url(@api_v1_device), as: :json
    assert_response :success
  end

  test "should update api_v1_device" do
    patch api_v1_device_url(@api_v1_device), params: { api_v1_device: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_device" do
    assert_difference('Api::V1::Device.count', -1) do
      delete api_v1_device_url(@api_v1_device), as: :json
    end

    assert_response 204
  end
end
