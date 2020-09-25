require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) do
    Event.new(name: "Rspec tests", description: "Doing tests", 
              date: "2020-09-20 12:06:29", location: "Virtual", 
              created_at: nil, updated_at: nil, creator_id: 2)
  end
  let(:event1) do
    Event.new(name: 'Rspec test', description: 'doing tests',
              date: '2020-09-30', location: 'Virtual', creator_id: 1)
  end
  let(:event2) do
    Event.new(name: nil, description: 'doing tests',
              date: '2020-09-30', location: 'Virtual', creator_id: 1)
  end
  let(:event3) do
    Event.new(name: 'Rspec test', description: 'This is plain text',
              date: '2020-09-30', location: 'Virtual', creator_id: 1)
  end
  let(:event4) do
    Event.new(name: 'Rspec test', description: 'doing tests',
              date: nil, location: 'Virtual', creator_id: 1)
  end
  let(:event5) do
    Event.new(name: 'Rspec test', description: 'doing tests',
              date: '2020-09-20', location: nil, creator_id: 1)
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
    it 'is invalid when name is invalid' do
      expect(event2.valid?).to eq false
    end

    it 'is invalid when name is invalid' do
      expect(event3.valid?).to eq false
    end

    it 'is invalid when name is invalid' do
      expect(event4.valid?).to eq false
    end

    it 'is invalid when name is invalid' do
      expect(event5.valid?).to eq false
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
