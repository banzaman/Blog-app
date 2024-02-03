require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before do
    @user = User.create(name: 'User')
    @post1 = @user.posts.create(title: 'Post 1', text: 'Post 1 body')
    @post2 = @user.posts.create(title: 'Post 2', text: 'Post 2 body')

    visit user_posts_path(@user)
  end

  it "displays the user's profile picture" do
    expect(page).to have_css("img[src='#{@user.photo}']")
  end

  it "displays the user's username" do
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 2')
  end

  it "displays a post's title and body" do
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 1 body')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 2 body')
  end

  it 'displays the first comments on a post' do
    comment1 = @post1.comments.create(author: @user, text: 'Comment 1')
    comment2 = @post1.comments.create(author: @user, text: 'Comment 2')

    visit user_posts_path(@user)

    expect(page).to have_content(comment1.text)
    expect(page).to have_content(comment2.text)
  end

  it 'displays the number of comments and likes on a post' do
    @post1.comments.create(author: @user, text: 'Comment')

    visit user_posts_path(@user)

    expect(page).to have_content('Comments: 1')
    expect(page).to have_content('Likes: 0')
  end

  it 'displays a section for pagination if there are more posts than fit on the view' do
    visit user_posts_path(@user)

    expect(page).to have_selector('.pagination-section')
  end

  it "redirects to the post's show page when clicking on a post" do
    click_link "Post ##{@post1.id}"
    sleep(1)
    expect(current_path).to eq(post_comments_path(@user, @post1))
  end
end
