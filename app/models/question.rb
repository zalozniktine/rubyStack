class Question < ApplicationRecord
    belongs_to :person
    has_many :answers
    accepts_nested_attributes_for :answers, allow_destroy: true
    has_rich_text :questionn
end
