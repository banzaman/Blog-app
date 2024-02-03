require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before do
    @user = User.create(name: 'User')
    @post = @user.posts.create(title: 'Post Title', text: 'Post Body')

    visit post_comments_path(@user, @post)
  end

  it "displays the post's title" do
    expect(page).to have_content("Post ##{@post.id}")
  end

  it 'displays the author of the post' do
    expect(page).to have_content('by User')
  end

  it 'displays the number of comments the post has' do
    expect(page).to have_content('Comments: 0')
  end

  it 'displays the number of likes the post has' do
    expect(page).to have_content('Likes: 0')
  end

  it 'displays the post body' do
    expect(page).to have_content('Post Body')
  end

  it 'displays the username of each commentor' do
    comment_author = User.create(name: 'Commentor')
    @post.comments.create(author: comment_author, text: 'Comment Text')

    visit post_comments_path(@user, @post)

    expect(page).to have_content('Commentor')
  end

  it 'displays the comment left by each commentor' do
    comment_author = User.create(name: 'Commentor')
    @post.comments.create(author: comment_author, text: 'Comment Text')

    visit post_comments_path(@user, @post)

    expect(page).to have_content('Comment Text')
  end
end
