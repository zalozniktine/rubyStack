class PagesController < ApplicationController
    def activity
        @user = current_person.id
        @questions = Question.where(person_id:@user)
    end
    def questions
        @user = current_person.id
        @questions = Question.where(person_id:@user)
    end
end
