require 'update_in_batches'

class AddTimeSpentToLibraryEntry < ActiveRecord::Migration
  using UpdateInBatches

  self.disable_ddl_transaction!

  def up
    change_column_null :library_entries, :time_spent, false, 0
  end

  def down
    remove_column :library_entries, :time_spent, :integer
  end
end
