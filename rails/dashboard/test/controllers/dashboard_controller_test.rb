require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get cgdc" do
    get dashboard_cgdc_url
    assert_response :success
  end

  test "should get cgdd" do
    get dashboard_cgdd_url
    assert_response :success
  end

  test "should get cidc" do
    get dashboard_cidc_url
    assert_response :success
  end

  test "should get cidd" do
    get dashboard_cidd_url
    assert_response :success
  end

end
