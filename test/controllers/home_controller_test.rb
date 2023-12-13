require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get search" do
    get home_search_url
    assert_response :success
  end

  test "should get get_pdf" do
    get "#{home_get_pdf_url}.pdf", params: {star: 'gaearon', place: 1}
    assert_response :success
  end

  test "should get get_zip" do
    get "#{home_get_zip_url}.zip", params: {stars: ['gaearon']}
    assert_response :success
  end
end
