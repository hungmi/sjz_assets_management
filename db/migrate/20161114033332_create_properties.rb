class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.text :name

      t.timestamps
    end
  end
end
