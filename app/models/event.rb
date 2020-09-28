class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendings
  has_many :event_attendees, through: 'event_attendings', source: :user

  scope :upcoming_events, -> { where('date >= ?', Date.today).order('date DESC') }
  scope :previous_events, -> { where('date < ?', Date.today).order('date DESC') }

  validates :name, :description, :date, :location,
            presence: true

  def past?
    date < Date.today
  end
end
