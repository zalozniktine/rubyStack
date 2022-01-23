class AddParentToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :parent_id, :integer, null: true
  end
end
