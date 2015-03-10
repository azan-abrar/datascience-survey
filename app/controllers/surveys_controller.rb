class SurveysController < ApplicationController
  before_filter :authenticate_user!, except: [:new, :create, :thanks]
  before_filter :admin_only, except: [:new, :create, :thanks]
  before_action :set_survey, only: [:show, :edit, :update, :destroy, :thanks]

  respond_to :html

  def index
    @surveys = initialize_grid(Survey)
    respond_with(@surveys)
  end

  def show
    respond_with(@survey)
  end

  def new
    @survey = Survey.new
    respond_with(@survey)
  end

  def edit
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to thanks_survey_path(@survey)
    else
      render action: :new
    end
  end

  def update
    @survey.update(survey_params)
    respond_with(@survey)
  end

  def destroy
    @survey.destroy
    respond_with(@survey)
  end

  def thanks
  end

  private
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit(:definition, {associated_areas: []}, :papers, :area_of_expertise, :name, :email)
    end
end
