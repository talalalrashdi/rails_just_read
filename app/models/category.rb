class Category < ApplicationRecord
  # associations
  has_many :books

  # validations
  validates :name, presence: true
  validates :name, uniqueness: true

  # multi-search
  # include PgSearch::Model
  # multisearchable against: :name

end
