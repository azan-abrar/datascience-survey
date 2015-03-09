require 'test_helper'

class SurveysControllerTest < ActionController::TestCase
  setup do
    @survey = surveys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:surveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey" do
    assert_difference('Survey.count') do
      post :create, survey: { area_of_expertise: @survey.area_of_expertise, big_data: @survey.big_data, data_engineering: @survey.data_engineering, definition: @survey.definition, email: @survey.email, machine_learning: @survey.machine_learning, name: @survey.name, papers: @survey.papers }
    end

    assert_redirected_to survey_path(assigns(:survey))
  end

  test "should show survey" do
    get :show, id: @survey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey
    assert_response :success
  end

  test "should update survey" do
    patch :update, id: @survey, survey: { area_of_expertise: @survey.area_of_expertise, big_data: @survey.big_data, data_engineering: @survey.data_engineering, definition: @survey.definition, email: @survey.email, machine_learning: @survey.machine_learning, name: @survey.name, papers: @survey.papers }
    assert_redirected_to survey_path(assigns(:survey))
  end

  test "should destroy survey" do
    assert_difference('Survey.count', -1) do
      delete :destroy, id: @survey
    end

    assert_redirected_to surveys_path
  end
end