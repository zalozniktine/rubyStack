class Answer < ApplicationRecord
  
  acts_as_votable

  belongs_to :question
  belongs_to :person
  belongs_to :parent, class_name: "Answer", optional: true
  has_many :answers, foreign_key: :parent_id

  has_many :likes, dependent: :destroy
end
