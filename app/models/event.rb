class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendings, foreign_key: 'attended_event_id'
  has_many :event_attendees, through: 'event_attendings', source: 'event_attendee'

  scope :upcoming_events, -> { where('date >= ?', Date.today).order('date DESC') }
  scope :previous_events, -> { where('date < ?', Date.today).order('date DESC') }

  def past?
    date < Date.today
  end
end
