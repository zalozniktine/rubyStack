class AddPersonIdToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :person_id, :integer
    add_index :answers, :person_id
  end
end
