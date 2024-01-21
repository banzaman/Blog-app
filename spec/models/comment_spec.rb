require 'rails_helper'

describe Comment, type: :model do
  it '#increment_comments_counter' do
    author = User.create!(name: 'Tom', post_counter: 0)
    post = Post.create!(title: '1', comments_counter: 0, likes_counter: 0, author:)
    Comment.create!(post:, author:)
    expect(post.comments_counter).to eq(1)
  end
end
