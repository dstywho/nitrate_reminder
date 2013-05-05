require 'test_helper'

class ReportDefinitionTestPlansControllerTest < ActionController::TestCase
  setup do
    @report_definition_test_plan = report_definition_test_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_definition_test_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_definition_test_plan" do
    assert_difference('ReportDefinitionTestPlan.count') do
      post :create, report_definition_test_plan: {  }
    end

    assert_redirected_to report_definition_test_plan_path(assigns(:report_definition_test_plan))
  end

  test "should show report_definition_test_plan" do
    get :show, id: @report_definition_test_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_definition_test_plan
    assert_response :success
  end

  test "should update report_definition_test_plan" do
    put :update, id: @report_definition_test_plan, report_definition_test_plan: {  }
    assert_redirected_to report_definition_test_plan_path(assigns(:report_definition_test_plan))
  end

  test "should destroy report_definition_test_plan" do
    assert_difference('ReportDefinitionTestPlan.count', -1) do
      delete :destroy, id: @report_definition_test_plan
    end

    assert_redirected_to report_definition_test_plans_path
  end
end
