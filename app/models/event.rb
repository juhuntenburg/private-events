class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendances
  has_many :attendees, through: :attendances, foreign_key: "attended_event_id",
           class_name: "User", source: :attendee
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true

end
