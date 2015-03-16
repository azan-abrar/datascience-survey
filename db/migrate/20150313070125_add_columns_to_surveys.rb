class AddColumnsToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :degree_level, :integer
    add_column :surveys, :big_data_vs_data_science, :text
    add_column :surveys, :machine_learning_vs_data_science, :text
    add_column :surveys, :stat_vs_data_science, :text
    add_column :surveys, :all_curation_tech, :boolean
    add_column :surveys, :all_crution_explain, :text
    add_column :surveys, :profession, :integer
    add_column :surveys, :discipline, :integer
    add_column :surveys, :experience_level, :integer
    add_column :surveys, :access_token, :string
    add_column :surveys, :step, :integer, default: 1, nil: 1
  end
end
