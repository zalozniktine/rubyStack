class RemoveQuestionIdFromAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :question_id, :integer
  end
end
