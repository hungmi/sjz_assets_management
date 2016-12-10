class Item < ApplicationRecord
  validates :name, presence: true

  include Tokenable
  include Scannable
end
