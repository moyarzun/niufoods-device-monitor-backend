class AddStatusToLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :status, :string
  end
end
