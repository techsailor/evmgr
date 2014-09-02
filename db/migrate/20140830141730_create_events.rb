class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :schedule
      t.datetime :next_occurrence

      t.timestamps
    end
  end
end
