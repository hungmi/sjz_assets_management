class Employee < ApplicationRecord
  include EmployeesImporter

  belongs_to :department
  has_many :items

  validates :title, :name, presence: true
end
