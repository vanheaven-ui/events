require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:event) do
    user.created_events.new(name: 'Rspec tests', description: 'Doing tests',
                            date: '2020-09-20 12:06:29', location: 'virtual')
  end
  let(:event1) do
    user.created_events.new(name: nil, description: 'doing tests',
                            date: '2020-09-30', location: 'Virtual')
  end
  let(:event2) do
    user.created_events.new(name: 'Rspec tests', description: nil,
                            date: '2020-09-20 12:06:29', location: 'virtual')
  end
  let(:event3) do
    user.created_events.new(name: 'Rspec tests', description: 'Doing tests',
                            date: nil, location: 'virtual')
  end
  let(:event4) do
    user.created_events.new(name: 'Rspec tests', description: 'Doing tests',
                            date: '2020-09-20 12:06:29', location: nil)
  end

  describe 'Associations' do
    it 'should belong to creator' do
      c = Event.reflect_on_association(:creator)
      expect(c.macro).to eq :belongs_to
    end

    it 'shoud have many event_attendees' do
      a = Event.reflect_on_association(:event_attendees)
      expect(a.macro).to eq :has_many
    end
  end

  context 'has valid attributes' do
    it 'is valid' do
      expect(event.valid?).to eq true
    end
  end

  context 'has invalid attributes' do
    it 'is invalid when name is falsy' do
      expect(event1.valid?).to eq false
    end

    it 'is invalid when description is falsy' do
      expect(event2.valid?).to eq false
    end

    it 'is invalid when date is falsy' do
      expect(event3.valid?).to eq false
    end

    it 'is invalid when location is falsy' do
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
