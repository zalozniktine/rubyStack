class Comment < ApplicationRecord
  belongs_to :answer
  belongs_to :person
end
