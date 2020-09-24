require 'rails_helper'

RSpec.describe Event, type: :model do
  let (:event) { Event.new(name: "Ezeko", description: "this is working", 
    date: "2020-09-20 00:00:00", location: "Virtual", 
    created_at: nil, updated_at: nil, creator_id: 1) }
  let (:event1) { Event.new(name: 'Rspec test', description: 'doing tests', 
    date: '2020-09-30', location: 'Virtual', creator_id: 1) }
  let (:event2) { Event.new(name: nil, description: 'doing tests', 
    date: '2020-09-30', location: 'Virtual', creator_id: 1) }
  let (:event3) { Event.new(name: 'Rspec test', description: nil, 
    date: '2020-09-30', location: 'Virtual', creator_id: 1) }
  let (:event4) { Event.new(name: 'Rspec test', description: 'doing tests', 
    date: nil, location: 'Virtual', creator_id: 1) }
  let (:event5) { Event.new(name: 'Rspec test', description: 'doing tests', 
    date: '2020-09-20', location: nil, creator_id: 1) }

  context 'has valid attributes' do
    it 'is valid' do
      expect(event).to be_valid
    end
  end

  context 'has invalid attributes' do
    it 'is invalid when name is invalid' do
      expect(event2).to be_valid
    end

    it 'is invalid when name is invalid' do
      expect(event3).to be_valid
    end

    it 'is invalid when name is invalid' do
      expect(event4).to be_valid
    end

    it 'is invalid when name is invalid' do
      expect(event5).to be_valid
    end
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

  describe '#past' do
    it 'returns true if event date is earlier than today\'s date ' do
      expect(event.past?).to eq(true)
    end

    it 'returns false if event date is later than today\'s date ' do
      expect(event1.past?).to eq(false)
    end
  end
end