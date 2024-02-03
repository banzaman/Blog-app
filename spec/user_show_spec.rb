require 'rails_helper'
RSpec.describe 'Users Show', type: :feature do
  let(:user) { User.create(name: 'Test User', bio: 'Test bio') }
  before do
    user.posts.create(title: 'Post 2', text: 'Test post 2')
    user.posts.create(title: 'Post 3', text: 'Test post 3')
    user.posts.create(title: 'Post 4', text: 'Test post 4')
    visit user_path(user)
    sleep(1)
  end
  it "displays the user's profile picture" do
    expect(page).to have_css("img[src='#{user.photo}']")
  end
  it "displays the user's username" do
    expect(page).to have_content(user.name)
  end
  it 'displays the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 3')
  end
  it "displays the user's bio" do
    expect(page).to have_content(user.bio)
  end
  it "displays the user's first 3 posts" do
    expect(page).to have_content('Test post 2')
    expect(page).to have_content('Test post 3')
    expect(page).to have_content('Test post 4')
  end
  it "displays a button that lets me view all of a user's posts." do
    expect(page).to have_content('See all posts')
  end
  it "redirects to the post's show page when clicking a user's post" do
    first_post = user.posts.first
    click_link "Post ##{first_post.id}"
    sleep(1)
    expect(current_path).to eq(post_comments_path(user, first_post))
  end
  it "redirects to the user's post index page when clicking to see all posts" do
    click_link 'See all posts'
    sleep(1)
    expect(current_path).to eq(user_posts_path(user))
  end
end
