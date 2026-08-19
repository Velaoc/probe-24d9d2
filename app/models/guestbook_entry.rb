class GuestbookEntry < ApplicationRecord
  MAX_MESSAGE_LENGTH = 500

  validates :name, presence: true, length: { maximum: 60 }
  validates :message, presence: true, length: { maximum: MAX_MESSAGE_LENGTH }

  scope :newest_first, -> { order(created_at: :desc, id: :desc) }
end
