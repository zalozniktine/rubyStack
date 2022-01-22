class Question < ApplicationRecord
    belongs_to :person
    has_many :answers
    has_many :comments
    accepts_nested_attributes_for :answers, allow_destroy: true
end
