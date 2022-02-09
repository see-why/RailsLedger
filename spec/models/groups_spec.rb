require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'groups model validations' do
    subject do
      Group.new
    end

    before { subject.save }

    it 'name presence' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'icon presense' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    describe 'group model methods' do
      before do
        subject.name = 'Food'
        subject.id = 1
        @record = Record.new(name: 'record', amount: 1000.0, id: 1)
        @record.groups << subject
        @record2 = Record.new(name: 'record 2', amount: 1000.0, id: 2)
        @record2.groups << subject
        subject.records << @record
        subject.records << @record2
        subject.save
      end

      it 'returns total records' do
        expect(subject.total_record).to eq(2)
      end

      it 'returns total records amount' do
        expect(subject.total_record_amount).to eq(2000)
      end
    end
  end
end
