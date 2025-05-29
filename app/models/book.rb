class Book < ApplicationRecord
  # associations
  belongs_to :category
  belongs_to :user

  # validations
  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates_associated :category

  # book cover / image upload
  has_one_attached :photo

  # multi-search
  include PgSearch::Model
  multisearchable against: [:title, :description, :author]
  pg_search_scope :search_by_title_description_author,
    against: [ :title, :description, :author ],
    using: {
      tsearch: { prefix: true }
    }
end
