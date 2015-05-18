class SurveysController < ApplicationController
  before_filter :authenticate_user!, only: [:destroy, :index, :show]
  before_filter :admin_only, only: [:destroy, :index, :show]
  before_action :set_survey, only: [:edit, :update, :destroy, :defining,
                                    :differentiation, :thanks]

  def index
    @surveys = initialize_grid(Survey)
  end

  def show
    @survey = Survey.find_by_id(params[:id])) if current_user && current_user.admin?
    redirect_to root_path, alert: 'Survey not found' if @survey.blank?
  end

  def intro
    @survey = (session[:access_token_datascience].blank?) ? Survey.new : Survey.find_by_access_token(session[:access_token_datascience])
    @survey.save
    session[:access_token_datascience] = @survey.access_token if session[:access_token_datascience].blank?
  end

  def edit
  end

  def update
    if @survey.update(survey_params)
      session.delete(:access_token_datascience)
      redirect_to_page(@survey)
    else
      actions = {Survey::ABOUT_YOU => :new, Survey::DEFINING => :defining, Survey::DIFFERENTIATION => :differentiation}
      render action: actions[@survey.step]
    end
  end

  def destroy
    @survey.destroy
    redirect_to surveys_path
  end

  def defining
  end

  def differentiation
  end

  def thanks
  end

  private

    def set_survey
      @survey = Survey.find_by_access_token(session[:access_token_datascience]) || Survey.find_by_access_token(params[:id]) || ((current_user && current_user.admin?) && Survey.find_by_id(params[:id]))
      redirect_to root_path, alert: 'Survey not found' if @survey.blank?
    end

    def survey_params
      params.require(:survey).permit(:definition, {associated_areas: []}, :papers,
        :area_of_expertise, :name, :email, :degree_level, :big_data_vs_data_science,
        :machine_learning_vs_data_science, :stat_vs_data_science, :all_curation_tech,
        :all_crution_explain, :step, :profession, :discipline, :experience_level, :ok_storing_details, :tag_list)
    end

    def redirect_to_page(survey)
      redirect_page = {Survey::ABOUT_YOU => defining_survey_path(id: survey.access_token),
        Survey::DEFINING => differentiation_survey_path(id: survey.access_token),
        Survey::DIFFERENTIATION => thanks_survey_path(id: survey.access_token)}
      redirect_to redirect_page[survey.step]
    end

end
