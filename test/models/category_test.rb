require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "Show all articles"
  category = Category.new(
    name: "test category"
  )

  article = Article.new(
    title: "Article one",
    body: "This is the body of the first article."
  )

  article_two = Article.new(
    title: "Article two",
    body: "This is the body of the second article."
  )

  article_three = Article.new(
    title: "Article three",
    body: "This is the body of the third article."
  )

  article.save
  article_two.save
  article_three.save

  assert total_articles = category.total_articles

  assert_equal 3, total_articles
  end

  test 'can create a category' do
    get "/categories/new"
    assert_response :success

    post "/categories",
    params: {category{name: "New Category", description: "This is my new category."}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test 'can see categories' do
    get "/categories"
    assert_response :success
    assert_select "li", "category.name"
  end

  test 'can edit category' do
    get "/categories/1/edit"
    assert_response :success

    patch "/categories/1"
    params: {category{name: "Technology", description: "Stay up-to-date with the latest in technology."}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
end
