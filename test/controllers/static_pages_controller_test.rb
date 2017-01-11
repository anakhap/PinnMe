require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "PinnMe App"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "PinnMe"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | PinnMe"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | PinnMe"
  end 

end
