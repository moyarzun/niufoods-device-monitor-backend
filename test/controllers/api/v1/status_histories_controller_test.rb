require "test_helper"

class Api::V1::StatusHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_status_history = api_v1_status_histories(:one)
  end

  test "should get index" do
    get api_v1_status_histories_url, as: :json
    assert_response :success
  end

  test "should create api_v1_status_history" do
    assert_difference('Api::V1::StatusHistory.count') do
      post api_v1_status_histories_url, params: { api_v1_status_history: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_status_history" do
    get api_v1_status_history_url(@api_v1_status_history), as: :json
    assert_response :success
  end

  test "should update api_v1_status_history" do
    patch api_v1_status_history_url(@api_v1_status_history), params: { api_v1_status_history: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_status_history" do
    assert_difference('Api::V1::StatusHistory.count', -1) do
      delete api_v1_status_history_url(@api_v1_status_history), as: :json
    end

    assert_response 204
  end
end
