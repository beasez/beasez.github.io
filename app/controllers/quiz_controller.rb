class QuizController < ApplicationController
  def index
  		@max_questions = Question.count
  end
  
  def start
	 total = params[:number].to_i
	 all = Question.all.map {|x| x.id.to_s}
	 session[:question_ids] = all.sort_by{rand}[0..(total-1)]
	 
	 session[:total]   = total
	 session[:current] = 0
	 session[:correct] = 0
	 
	 redirect_to :action => "question"
  end

  def question
	 @current = session[:current]
	 @total   = session[:total]
	 
	 if @current >= @total
		redirect_to :action => "end"
		return
	 end
	 
	 @question = Question.find(session[:question_ids][@current])
	 @choices = @question.choices.sort_by{rand}
	 
	 session[:question_id] = @question.id.to_s
	 session[:choice_ids] = @choices.map{|c| c.id.to_s }
  end

  def answer
	 @current = session[:current]
	 @total   = session[:total]
	 
	 choiceid = params[:choice]
	 
	 @question = Question.find(session[:question_id])
	 @choices  = Choice.find(session[:choice_ids])
	 
	 @choice = choiceid ? Choice.find(choiceid) : nil
	 if @choice and @choice.correct
		@correct = true
		session[:correct] += 1
	 else
		@correct = false
	 end
	 
	 session[:current] += 1
  end

  def end
	 @correct = session[:correct]
	 @total   = session[:total]
	 
	 @score = @correct * 100 / @total
  end

end
