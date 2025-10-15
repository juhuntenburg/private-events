class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, foreign_key: "attended_event_id",
           class_name: "User", source: :attendee
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true

  scope :past, -> { where("date < ?", Time.now) }
  scope :future, -> { where("date > ?", Time.now) }

end
