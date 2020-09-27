class EventAttending < ApplicationRecord
  belongs_to :User
  belongs_to :event
end
