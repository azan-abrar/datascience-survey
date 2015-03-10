class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.text :definition
      t.text :associated_areas
      t.text :papers
      t.text :area_of_expertise
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
