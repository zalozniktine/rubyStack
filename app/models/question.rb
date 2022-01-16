class Question < ApplicationRecord
    belongs_to :person
    has_many :answers
end
