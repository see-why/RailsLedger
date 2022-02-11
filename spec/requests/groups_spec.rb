require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'GET /index' do
    before(:example) { get groups_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'contains correct text' do
      expect(response.body).to include('Categories')
    end
  end

  describe 'GET /new' do
    before(:example) { get new_group_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:new)
    end

    it 'contains correct text' do
      expect(response.body).to include('New Category')
    end
  end
end
