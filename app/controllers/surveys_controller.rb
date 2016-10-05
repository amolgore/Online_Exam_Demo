class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  include SurveysHelper 
  
  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.most_recent
  end


  # GET /surveys/1
  # GET /surveys/1.json
  def show
     @answers = Answer.new
     @questions_by_set = @survey.questions
     @questions_by_set_with_paginate = @questions_by_set.paginate(:page => params[:page], :per_page => 4) 
     respond_to do |format|
      format.html
      format.js
    end
  end

 
  # GET /surveys/new
  def new
    @survey = Survey.new
    @survey.questions.build  
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)
    respond_to do |format|
      if @survey.save
        students = User.with_role :student
        student_emails = students.map(&:email)  
        survey_name =@survey.name
        SurveysWorker.perform_async(student_emails,survey_name)
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.json{render json: @survey}
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name ,questions_attributes: [ :id, :content, :survey_id ,:_destroy, options_attributes: [ :id, :question_id, :is_correct,:option_text ,:_destroy]])
    end
end
