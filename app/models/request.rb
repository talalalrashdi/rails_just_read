class Request < ApplicationRecord
  # associations
  belongs_to :book
  belongs_to :user

  # validations
  validates :status, numericality: { only_integer: true }

end
