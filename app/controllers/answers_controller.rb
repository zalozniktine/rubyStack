class AnswersController < ApplicationController
    before_action :authenticate_person!

    def destroy
        Answer.find(params[:id]).destroy
        redirect_to question_path(params[:question_id])
    end

    def create
        #create a new answer
        @answer = current_person.answers.new(answer_params)
        if !@answer.save
            flash[:notice] = @answer.errors.full_messages.to_sentence
        end

        redirect_to question_path(params[:question_id])
    end

    private

    def answer_params
        params
        .require(:answer)
        .permit(:content, :parent_id)
        .merge(question_id: params[:question_id])
    end

end
