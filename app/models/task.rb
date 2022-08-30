class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  validates :done, inclusion: [true, false]
end
