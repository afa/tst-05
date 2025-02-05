require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /create" do
    it "returns http success" do
      post "/users", params: { format: :json, email: 'test@example.com' }
      expect(response).to have_http_status(:success)
    end
  end

end
