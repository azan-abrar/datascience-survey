class AddColumnOkStoringDetails < ActiveRecord::Migration
  def change
  	add_column :surveys, :ok_storing_details, :boolean
  end
end
