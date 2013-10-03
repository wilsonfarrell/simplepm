require 'test_helper'

class PlanningTimesControllerTest < ActionController::TestCase
  setup do
    @planning_time = planning_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planning_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planning_time" do
    assert_difference('PlanningTime.count') do
      post :create, planning_time: { end_date: @planning_time.end_date, start_date: @planning_time.start_date, time_pct: @planning_time.time_pct }
    end

    assert_redirected_to planning_time_path(assigns(:planning_time))
  end

  test "should show planning_time" do
    get :show, id: @planning_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planning_time
    assert_response :success
  end

  test "should update planning_time" do
    put :update, id: @planning_time, planning_time: { end_date: @planning_time.end_date, start_date: @planning_time.start_date, time_pct: @planning_time.time_pct }
    assert_redirected_to planning_time_path(assigns(:planning_time))
  end

  test "should destroy planning_time" do
    assert_difference('PlanningTime.count', -1) do
      delete :destroy, id: @planning_time
    end

    assert_redirected_to planning_times_path
  end
end
