class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :title
      t.belongs_to :department, foreign_key: true, index: true

      t.timestamps
    end
  end
end
