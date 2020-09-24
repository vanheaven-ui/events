require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { User.new(name: 'DePaul') }
  let(:user2) { User.new(name: nil) }
  context 'with valid attributes' do
    it 'is valid' do
      expect(user1).to be_valid
    end
  end

  context 'without valid attributes' do
    it 'is not valid' do
      expect(user2).to be_invalid
    end
  end

  describe 'Associations' do
    it 'has_many created events' do
      e = User.reflect_on_association(:created_events)
      expect(e.macro).to eq :has_many
    end
  end
end
