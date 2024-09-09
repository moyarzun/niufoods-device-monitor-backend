class CreateStatusLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :status_logs do |t|
      t.references :device
      t.references :status
      t.datetime :reported_at

      t.timestamps
    end
  end
end
