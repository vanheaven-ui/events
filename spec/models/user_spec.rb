require 'rails_helper'

RSpec.describe 'Model', type: :model do
  describe User do
    let(:user1) { User.new(name: 'DePaul') }
    let(:user2) { User.new(name: nil) }
    context 'with valid attributes' do
      it 'is valid' do
        expect(user1.valid?).to eq true
      end
    end

    context 'without valid attributes' do
      it 'is not valid' do
        expect(user2.valid?).to eq false
      end
    end

    describe 'Associations' do
      it { should have_many :created_events }
    end
  end
end
