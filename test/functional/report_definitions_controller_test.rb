require 'test_helper'

class ReportDefinitionsControllerTest < ActionController::TestCase
  setup do
    @report_definition = report_definitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_definitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_definition" do
    assert_difference('ReportDefinition.count') do
      post :create, report_definition: { name: @report_definition.name }
    end

    assert_redirected_to report_definition_path(assigns(:report_definition))
  end

  test "should show report_definition" do
    get :show, id: @report_definition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_definition
    assert_response :success
  end

  test "should update report_definition" do
    put :update, id: @report_definition, report_definition: { name: @report_definition.name }
    assert_redirected_to report_definition_path(assigns(:report_definition))
  end

  test "should destroy report_definition" do
    assert_difference('ReportDefinition.count', -1) do
      delete :destroy, id: @report_definition
    end

    assert_redirected_to report_definitions_path
  end
end
