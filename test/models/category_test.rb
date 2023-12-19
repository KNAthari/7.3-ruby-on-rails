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
end
