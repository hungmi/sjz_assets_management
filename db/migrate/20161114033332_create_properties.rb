class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :spec
      t.string :quantity
      t.string :unit
      t.string :token
      t.text :qr_code

      t.timestamps
    end
  end
end
