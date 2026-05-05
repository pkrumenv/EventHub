class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :events_attended, through: :registrations, source: :event

  validates :name, :email, presence: true
  validates :email, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
end