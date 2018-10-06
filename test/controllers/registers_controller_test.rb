require 'test_helper'

class RegistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @register = registers(:one)
  end

  test "should get index" do
    get registers_url, as: :json
    assert_response :success
  end

  test "should create register" do
    assert_difference('Register.count') do
      post registers_url, params: { register: { day_id: @register.day_id, entry: @register.entry, exit: @register.exit, user_id: @register.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show register" do
    get register_url(@register), as: :json
    assert_response :success
  end

  test "should update register" do
    patch register_url(@register), params: { register: { day_id: @register.day_id, entry: @register.entry, exit: @register.exit, user_id: @register.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy register" do
    assert_difference('Register.count', -1) do
      delete register_url(@register), as: :json
    end

    assert_response 204
  end
end
