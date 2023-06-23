require 'rails_helper'

describe Post, type: :model do
  # Validations
  describe 'Title' do
    it 'Should not be blank' do
      post = Post.new(title: nil)
      expect(post).to_not be_valid
    end

    it 'Should not exceed 250 characters' do
      post = Post.new(title: 'a' * 251)
      expect(post).to_not be_valid
    end
  end

  describe 'comments_counter' do
    it 'Should be an integer greater than or equal to 0' do
      post = Post.new(title: '1', comments_counter: -1)
      expect(post).to_not be_valid
    end
  end

  describe 'likes_counter' do
    it 'Should be an integer greater than or equal to 0' do
      post = Post.new(title: '1', likes_counter: -1)
      expect(post).to_not be_valid
    end
  end

  # Custom Methods
  describe '#recent_comments' do
    it 'Should retrieve last 5 comments' do
      user = User.create!(name: 'John', post_counter: 0)
      post = Post.create!(title: '1', author: user)
      Comment.create!(text: '1', author: user, post:)
      Comment.create!(text: '2', author: user, post:)
      Comment.create!(text: '3', author: user, post:)
      Comment.create!(text: '4', author: user, post:)
      Comment.create!(text: '5', author: user, post:)
      Comment.create!(text: '6', author: user, post:)
      recent_comments = post.recent_comments
      expect(recent_comments.size).to eq(5)
    end
  end
end
