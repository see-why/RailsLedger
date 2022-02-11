require 'rails_helper'

RSpec.describe Record, type: :model do
  describe 'record model validations' do
    subject do
      Record.new
    end

    before { subject.save }

    it 'should have name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have amount' do
      subject.amount = -1.0
      expect(subject).to_not be_valid
    end
  end
end
