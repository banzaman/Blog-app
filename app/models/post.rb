class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :increment_post_counter

  private

  def increment_post_counter
    update(post_counter: post_counter + 1)
  end
end
