require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model validations' do
    subject do
      User.new
    end

    before { subject.save }

    it 'name presence' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'email presence' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'password presence' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end
