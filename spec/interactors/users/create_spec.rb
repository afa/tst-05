require 'rails_helper'

RSpec.describe Users::Create do
  let(:interest_names) { %w[int_1 int_2] }
  let!(:interests) { interest_names.map { |name| Interest.create(name:) } }
  let(:skill_names) { %w[int_1 int_2] }
  let!(:skills) { skill_names.map { |name| Skil.create(name:) } }

  context 'success path' do
    let(:interactor_result) { interactor_call.result }
    let(:interactor_call) { described_class.run('params' => params) }
    let(:params) {
      {
        'interests' => interest_names.join(','), 'skills' => skill_names.join(','),
        'name' => 'name', 'surname' => 'surname', 'patronymic' => 'patronymic', 'email' => 'email@example.com',
        'age' => 10, 'nationality' => 'swe', 'country' => 'un', 'gender' => 'male'
      }
    }

    it 'should be valid' do
      expect(interactor_call).to be_valid
    end

    it 'should return valid result' do
      expect(interactor_result).not_to be_nil
    end

    it 'should not raise' do
      expect { interactor_call }.not_to raise_error
    end
  end
end
