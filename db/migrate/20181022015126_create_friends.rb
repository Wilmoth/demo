class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.string :username
      t.string :fullname

      t.timestamps
    end
  end
end
