require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    @category = categories(:one)
    @article = articles(:one) #Fixtures create dummy data you can use to test your controller (you can use erb code in fixtures)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should show category" do
    sign_in @user
    get category_url(@category)
    assert_response :success
  end

  test "should get new category" do
    sign_in @user
    get new_category_url
    assert_response :success
  end


  test "should create category" do
    assert_difference(category.count, 1) do
      post categories_url, params: {category: {name: "sports", description: "Cool sport stuff"}} 
    end
    assert_redirected_to category_url
  end

  test "should edit category" do
    sign_in @user
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    sign_in @user
    patch catgeory_url, params {catgeory: {name: "Technology", description: "Learn about new advancements in tech"}}
    assert_redirected_to category_url
    @category.reload
    assert_equal "Technology", @category.name
  end

  test "Should delete category" do
    sign_in @user
    assert_difference(category.count, -1) do
      delete category_url(@category)
    end

    assert_redirected_to category_url
  end

end
