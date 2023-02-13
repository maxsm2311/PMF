class Category < ApplicationRecord
  has_many :operations, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true

  paginates_per 5
end
