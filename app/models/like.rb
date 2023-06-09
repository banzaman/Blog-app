class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def increment_like_counter
    update(likes_counter: likes_counter + 1)
  end
end
