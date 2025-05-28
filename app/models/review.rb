class Review < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :request

  # validations
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, format: { with: /\A[0-5]?\z/,
    message: "only allows rating from 0 to 5" }
  validates :user_id, uniqueness: { scope: :request_id,
    message: "only one review per rental experience" }

end
