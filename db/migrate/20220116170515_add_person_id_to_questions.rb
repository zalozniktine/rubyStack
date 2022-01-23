class AddPersonIdToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :person_id, :integer
    add_index :questions, :person_id
  end
end
