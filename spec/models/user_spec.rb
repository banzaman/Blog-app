require 'rails_helper'

describe User, type: :model do
  # Validations
  it 'Should have a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'Should be an integer greater than or equal to 0' do
    user = User.new(post_counter: -1)
    expect(user).to_not be_valid
  end

  it 'Should be an integer greater than or equal to 0' do
    user = User.new(name: 'Tom', post_counter: 0)
    expect(user).to be_valid
  end

  # Custom Methods
  it '#last_three_posts' do
    user = User.create!(name: 'Tom', post_counter: 0)
    Post.create!(title: '1', author: user)
    Post.create!(title: '2', author: user)
    Post.create!(title: '3', author: user)
    Post.create!(title: '4', author: user)
    recent_posts = user.last_three_posts
    expect(recent_posts.size).to eq(3)
  end
end
