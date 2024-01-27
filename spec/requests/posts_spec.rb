require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      get '/users/745/posts'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users/745/posts'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get '/users/745/posts'
      expect(response.body).to match(/Here is a list of POSTS for a given user/)
    end
  end

  describe 'GET /show' do
    it 'returns a success response' do
      get '/users/745/posts/3'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users/745/posts/3'
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      get '/users/745/posts/3'
      expect(response.body).to match(/Here is a specific POST/)
    end
  end
end
