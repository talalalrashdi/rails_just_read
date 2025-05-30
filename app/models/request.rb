class Request < ApplicationRecord
  # associations
  belongs_to :book
  belongs_to :user

  # request status
  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2,
    expired: 3
  }
end
