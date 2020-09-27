require 'rails_helper'

RSpec.describe 'Model', type: :model do
  describe Event do
    let(:user) { User.create(name: 'John Doe') }
    let(:event) do
      user.created_events.new(name: 'Rspec tests', description: 'Doing tests',
                              date: '2020-09-20 12:06:29', location: 'virtual')
    end
    let(:event1) do
      user.created_events.new(name: nil, description: 'Doing tests',
                              date: '2050-09-20 12:06:29', location: 'virtual')
    end
    let(:event2) do
      user.created_events.new(name: 'Rspec tests', description: nil,
                              date: '2050-09-20 12:06:29', location: 'virtual')
    end
    let(:event3) do
      user.created_events.new(name: 'Rspec tests', description: 'Doing tests',
                              date: nil, location: 'virtual')
    end
    let(:event4) do
      user.created_events.new(name: 'Rspec tests', description: 'Doing tests',
                              date: '2050-09-20 12:06:29', location: nil)
    end

    describe 'Associations' do
      it { should belong_to :creator }

      it { should have_many :event_attendees }
    end

    context 'has valid attributes' do
      it { should validate_presence_of :name }

      it { should validate_presence_of :description }

      it { should validate_presence_of :date }

      it { should validate_presence_of :location }
    end

    context 'has invalid attributes' do
      it 'is invalid if name is falsy' do
        expect(event1.valid?).to eq false
      end

      it 'is invalid if description is falsy' do
        expect(event2.valid?).to eq false
      end

      it 'is invalid if date is falsy' do
        expect(event3.valid?).to eq false
      end

      it 'is invalid if location is falsy' do
        expect(event4.valid?).to eq false
      end
    end

    describe '#past' do
      it 'returns true if event date is earlier than today\'s date ' do
        expect(event.past?).to eq(true)
      end

      it 'returns false if event date is later than today\'s date ' do
        expect(event1.past?).to eq(false)
      end
    end
  end
end
