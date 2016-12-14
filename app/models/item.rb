class Item < ApplicationRecord
  mount_uploader :image, ItemImageUploader

  validates :name, presence: true

  belongs_to :department
  belongs_to :employee

  include Tokenable
end
