class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def increment_comment_counter
    update(comments_counter: comments_counter + 1)
  end
end
