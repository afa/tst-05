require 'rails_helper'

RSpec.describe Users::Create do
  let(:interest_names) { %w[int_1 int_2] }
  let!(:interests) { interest_names.map { |name| Interest.create(name:) } }
  let(:skill_names) { %w[int_1 int_2] }
  let!(:skills) { skill_names.map { |name| Skil.create(name:) } }
  let(:interactor_result) { interactor_call.result }
  let(:interactor_call) { described_class.run(params) }
  let(:params) {
    {
      'interests' => interest_names, 'skills' => skill_names.join(','),
      'name' => 'name', 'surname' => 'surname', 'patronymic' => 'patronymic', 'email' => 'email@example.com',
      'age' => 10, 'nationality' => 'swe', 'country' => 'un', 'gender' => 'male'
    }
  }

  context 'success path' do
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

  context 'params validations' do
    let(:removable) { params.except('surname', 'interests', 'skills').keys }

    ['surname', 'interests', 'skills'].each do |blanked|
      it "should be valid when #{blanked} param blank" do
        expect(described_class.run(params.except(blanked))).to be_valid
      end
    end

    ['name', 'patronymic', 'email', 'age', 'nationality', 'country', 'gender'].each do |blanked|
      it "should be invalid when #{blanked} param blank" do
        expect(described_class.run(params.except(blanked))).not_to be_valid
      end
    end
  end

  context 'age validation' do
    it 'for <= 0' do
      expect(described_class.run(params.merge(age: 91))).not_to be_valid
    end

    it 'for > 90' do
      expect(described_class.run(params.merge(age: 0))).not_to be_valid
    end
  end

  context 'gender validation' do
    it 'for invalid' do
      expect(described_class.run(params.merge(gender: 'bad'))).not_to be_valid
    end
  end

  context 'email validation' do
    before { User.create(params.except('interests', 'skills')) }

    it 'for duplicate' do
      expect(described_class.run(params)).not_to be_valid
    end
  end
end
