class Item < ApplicationRecord
  mount_uploader :image, ItemImageUploader
  include ItemsImporter
  # include Tokenable
  include Rails.application.routes.url_helpers

  validates :name, presence: true

  belongs_to :department
  belongs_to :employee

  # def form_url
  #   self.persisted? ? item_path(self.token) : items_path
  # end
end
