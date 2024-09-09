require "test_helper"

class Api::V1::StatusLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_status_log = api_v1_status_logs(:one)
  end

  test "should get index" do
    get api_v1_status_logs_url, as: :json
    assert_response :success
  end

  test "should create api_v1_status_log" do
    assert_difference('Api::V1::StatusLog.count') do
      post api_v1_status_logs_url, params: { api_v1_status_log: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_status_log" do
    get api_v1_status_log_url(@api_v1_status_log), as: :json
    assert_response :success
  end

  test "should update api_v1_status_log" do
    patch api_v1_status_log_url(@api_v1_status_log), params: { api_v1_status_log: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_status_log" do
    assert_difference('Api::V1::StatusLog.count', -1) do
      delete api_v1_status_log_url(@api_v1_status_log), as: :json
    end

    assert_response 204
  end
end
