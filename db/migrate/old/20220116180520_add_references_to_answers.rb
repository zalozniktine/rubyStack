class AddReferencesToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_reference :answers, :question, null: false, foreign_key: true
    add_reference :answers, :person, null: false, foreign_key: true
  end
end
