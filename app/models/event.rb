class Event < ApplicationRecord
  has_many :event_attendances
  has_many :members, through: :event_attendances
end
