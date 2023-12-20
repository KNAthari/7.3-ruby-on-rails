require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not be able to update without signing in" do
    article = Article.new
    article.save
  end

  test "should not save article with a short body" do
    category = Category.create(name: "Sample Category", description: "Category description")

    article = Article.new(
      title: "Valid Title",
      body: "This is a valid body with more than 10 characters."
    )

    assert_not article.save, "Saved the article without a category"
  end

  test "Should show five most recent articles" do

    article_one = Article.new(
      title: "article one",
      body: "This is the body of our first article."
    )

    article_two = Article.new(
      title: "article two",
      body: "This is the body for our second article."
    )

    article_three = Article.new(
      title: "article three",
      body: "This is the body for our third article."
    )

    article_four = Article.new(
      title: "article four",
      body: "This is the body for our fourth article."
    )

    article_five = Article.new(
      title: "article five",
      body: "This is the body for our fifth article."
    )

    assert article_one.save
    assert article_two.save
    assert article_three.save
    assert article_four.save
    assert article_five.save

    recent_articles = Article.recent_articles

    assert_equal [article_five, article_four, article_three, article_two, article_one], recent_articles
  end

  test 'can show article' do
    get "/categories/1/article/1"
    assert_response :success
  end

  test 'can delete article' do
    get "/categories/1/article/1"
    assert_response :success

    Delete "/categories/1/article/1"
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

end

