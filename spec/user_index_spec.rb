require 'rails_helper'
RSpec.describe 'Users Index', type: :feature do
  before do
    @user1 = User.create(name: 'User 1', post_counter: 3)
    @user2 = User.create(name: 'User 2', post_counter: 5)
    visit users_path
    sleep(1)
  end
  it 'displays the username of all other users' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end
  it 'displays the profile picture for each user' do
    expect(page).to have_css("img[src='#{@user1.photo}']")
    expect(page).to have_css("img[src='#{@user2.photo}']")
  end
  it 'displays the number of posts each user has written' do
    expect(page).to have_content('Number of posts: 3', count: 1)
    expect(page).to have_content('Number of posts: 5', count: 1)
  end
  it "redirects to the user's show page when clicking on a user" do
    click_link @user1.name
    sleep(1)
    expect(current_path).to eq(user_path(@user1.id))
  end
end
