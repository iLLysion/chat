class Room < ApplicationRecord
  ASSOCIATIONS = { messages: [:user, likes: :user ] }.freeze

  belongs_to :user
  has_many :messages, -> { sorted }, dependent: :destroy

  scope :with_associations, -> { includes(ASSOCIATIONS) }
  scope :sorted, -> { order(:created_at) }

  before_create { self.name = SecureRandom.hex(3) }
end
