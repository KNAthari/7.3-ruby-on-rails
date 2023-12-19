require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "Show user comments"
    user = user.new(
      first_name: "Joe"
      last_name: "Manchin"
      user_comments: "Jchin"
    )

    assert user.save

    comment_one = (
      commenter: "Joe Manchin"
      comment: "First!!!!"
      user: user
    )

    comment_two = (
      commenter: "Joe Manchin"
      comment: "Hello again!!!"
      user: user
    )

    comment_three = (
      commenter: "Joe Manchin"
      comment: "New comment."
      user: user
    )

    assert comment_one.save
    assert comment_two.save
    assert comment_three.save

    user_comments = user.comments

  end
end
