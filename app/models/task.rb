class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  validates :done, inclusion: [true, false]

  scope :search, lambda { |q| q.present? ? where('content LIKE ?', "%#{q}%") : self }
end
