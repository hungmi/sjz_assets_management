class Property < ApplicationRecord
  validates :name, presence: true

  include Tokenable
  include Scannable
end
