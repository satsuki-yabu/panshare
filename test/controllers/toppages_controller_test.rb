require 'test_helper'

class ToppagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index" do
    assert_raises(NameError) do
    get toppages_index_url
    assert_response :success
  end
end

end
