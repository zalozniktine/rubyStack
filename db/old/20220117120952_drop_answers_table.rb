class DropAnswersTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :answers
  end
end
