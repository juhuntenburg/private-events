class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hosted_events, foreign_key: "host_id", class_name: "Event"
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances, foreign_key: "attendee_id",
           class_name: "Event", source: :attended_event
  has_many :invitations, foreign_key: :invitee_id
  has_many :invited_events, through: :invitations, foreign_key: "invitee_id",
           class_name: "Event", source: :invited_event
  validates :name, presence: true
end
