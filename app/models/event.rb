class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, foreign_key: "attended_event_id",
           class_name: "User", source: :attendee
  has_many :invitations, foreign_key: :invited_event_id
  has_many :invitees, through: :invitations, foreign_key: "invited_event_id",
           class_name: "User", source: :invitee
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true

  scope :past, -> { where("date < ?", Time.now) }
  scope :future, -> { where("date > ?", Time.now) }

end
