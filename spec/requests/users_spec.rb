require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:interest_names) { %w[int_1 int_2] }
  let!(:interests) { interest_names.map { |name| Interest.create(name:) } }
  let(:skill_names) { %w[sk_1 sk_2] }
  let!(:skills) { skill_names.map { |name| Skil.create(name:) } }

  before { post "/users", params: { format: :json }.merge(params) }

  describe "POST /create" do
    context 'invalid params' do
      let(:params) {
        {
          'interests' => interest_names, 'skills' => skill_names.join(','),
          'name' => 'name', 'surname' => 'surname', 'patronymic' => 'patronymic', 'email' => 'email@example.com'
        }
      }

      it "returns http success" do
        expect(response).to have_http_status(422)
      end
    end

    context 'success path' do
      let(:params) {
        {
          'interests' => interest_names, 'skills' => skill_names.join(','),
          'name' => 'name', 'surname' => 'surname', 'patronymic' => 'patronymic', 'email' => 'email@example.com',
          'age' => 10, 'nationality' => 'swe', 'country' => 'un', 'gender' => 'male'
        }
      }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
