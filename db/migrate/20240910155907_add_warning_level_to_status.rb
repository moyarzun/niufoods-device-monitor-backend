class AddWarningLevelToStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :status, :warning_level, :integer
  end
end
