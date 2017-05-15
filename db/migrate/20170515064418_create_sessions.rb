class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string :session_id
      t.string :user_id

      t.timestamps
    end
  end
end
