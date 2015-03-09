class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.text :definition
      t.boolean :machine_learning
      t.boolean :big_data
      t.boolean :data_engineering
      t.text :papers
      t.text :area_of_expertise
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
