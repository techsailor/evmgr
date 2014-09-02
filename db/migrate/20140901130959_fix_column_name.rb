class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :events, :next_occurrence, :next_instance
  end

  def down
    rename_column :events, :next_instance, :next_occurrence
  end
end
