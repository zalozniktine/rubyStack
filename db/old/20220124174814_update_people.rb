class UpdatePeople < ActiveRecord::Migration[6.1]
  def change
    add_column(:people, :provider, :string, limit: 50, null: false, default: '')
    add_column(:people, :uid, :string, limit: 500, null: false, default: '')
  end
end
