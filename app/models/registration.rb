class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum :status, { pending: 0, confirmed: 1, cancelled: 2 }

  validates :user_id, uniqueness: { scope: :event_id }

  validate :event_capacity_not_exceeded

  private

  def event_capacity_not_exceeded
    if event.present? && event.registrations.count >= event.capacity
      errors.add(:event, "is full")
    end
  end
end