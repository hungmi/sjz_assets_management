class Employee < ApplicationRecord
  belongs_to :department
  has_many :items
end
