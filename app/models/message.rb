class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :likes, dependent: :destroy

  scope :sorted, -> { order(:created_at) }
  validates :body, presence: true
end
