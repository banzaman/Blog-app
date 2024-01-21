require 'rails_helper'

describe Like, type: :model do
  it '#increment_likes_counter' do
    author = User.create!(name: 'Tom', post_counter: 0)
    post = Post.create!(title: '1', comments_counter: 1, likes_counter: 0, author:)
    Like.create!(post:, author:)
    expect(post.likes_counter).to eq(1)
  end
end
