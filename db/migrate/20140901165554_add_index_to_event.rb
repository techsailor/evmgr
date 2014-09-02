class AddIndexToEvent < ActiveRecord::Migration
  def change
    add_index :events, :next_instance
  end
end
