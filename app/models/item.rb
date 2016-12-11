class Item < ApplicationRecord
  validates :name, presence: true

  belongs_to :department
  belongs_to :employee

  include Tokenable
  # include Scannable
end
