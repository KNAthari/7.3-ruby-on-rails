require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @category = categories(:one)
    @article = articles(:one) #Fixtures create dummy data you can use to test your controller (you can use erb code in fixtures)
  end

  test "should get index" do
    get category_article_path(@category, @article)
    assert_response :success
  end

  test "should show article" do
    get category_article_path
  end

  test "should get new" do
    sign_in @user
    get new_category_article_url(@category)
    assert_response :success
  end

  test "should update article" do
    sign_in @user

  end
end
