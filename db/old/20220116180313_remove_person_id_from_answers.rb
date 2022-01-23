class RemovePersonIdFromAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :person_id, :integer
  end
end
