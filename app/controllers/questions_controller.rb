class QuestionsController < ApplicationController
   GET /questions
   GET /questions.xml
  def index
    @questions = Question.all
    @questions.sort! {|a,b| a.text <=> b.text}

    respond_to do |format|
      format.html # index.html.erb
    end
  end

 GET /questions/1
  GET /questions/1.xml

  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      
    end
  end

  GET /questions/new
  GET /questions/new.xml
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      
    end
  end
  
  

  