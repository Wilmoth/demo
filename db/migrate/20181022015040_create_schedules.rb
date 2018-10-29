class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date
      t.string :username
      t.string :mark
      t.text :comment

      t.timestamps
    end
  end
end
