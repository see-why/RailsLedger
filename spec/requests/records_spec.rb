require 'rails_helper'

RSpec.describe 'Records', type: :request do
  describe 'GET /new' do
    before(:example) { get new_record_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:new)
    end

    it 'contains correct text' do
      expect(response.body).to include('New Record')
    end
  end
end
