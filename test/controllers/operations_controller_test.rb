require "test_helper"

class OperationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operation = operations(:one)
  end

  test "should get index" do
    get category_operation_path(@operations)
    assert_response :success
  end

  test "should get new" do
    get new_category_operation_path(operation)
    assert_response :success
  end

  test "should create operation" do
    assert_difference("Operation.count") do
      post category_operations_path, params: { operation: { amount: @operation.amount, category_id: @operation.category_id, description: @operation.description, odate: @operation.odate } }
    end

    assert_redirected_to operation_path(Operation.last)
  end

  test "should show operation" do
    operation = Operation.create(description: "Test operation", amount: 100)
  get category_operation_path(operation)
  assert_response :success
  end

  test "should get edit" do
    get edit_category_operation_path(@operation)
    assert_response :success
  end

  test "should update operation" do
    patch category_operation_url(@operation), params: { operation: { amount: @operation.amount, category_id: @operation.category_id, description: @operation.description, odate: @operation.odate } }
    assert_redirected_to category_operation_url(@operation)
  end

  test "should destroy operation" do
    assert_difference("Operation.count", -1) do
      delete category_operation_path(@operation)
    end

    assert_redirected_to operations_url
  end
end
