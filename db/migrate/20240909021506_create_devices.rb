class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.references :location
      t.string :name

      t.timestamps
    end
  end
end
