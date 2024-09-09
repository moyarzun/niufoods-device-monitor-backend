require "test_helper"

class Api::V1::StatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_state = api_v1_states(:one)
  end

  test "should get index" do
    get api_v1_states_url, as: :json
    assert_response :success
  end

  test "should create api_v1_state" do
    assert_difference('Api::V1::State.count') do
      post api_v1_states_url, params: { api_v1_state: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_state" do
    get api_v1_state_url(@api_v1_state), as: :json
    assert_response :success
  end

  test "should update api_v1_state" do
    patch api_v1_state_url(@api_v1_state), params: { api_v1_state: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_state" do
    assert_difference('Api::V1::State.count', -1) do
      delete api_v1_state_url(@api_v1_state), as: :json
    end

    assert_response 204
  end
end
