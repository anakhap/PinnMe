require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "PinnMe App"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help"
  end

end
