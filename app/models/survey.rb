class Survey < ActiveRecord::Base
	validates :definition, :papers, :area_of_expertise, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, if: "email&&email!=''"
	serialize :associated_areas, Array
	ASSOCIATED_AREAS = {
		1 => 'Predictive Analytics',
		2 => 'Visualization',
		3 => 'Deriving Knowledge From Facts',
		4 => 'Artificial Intelligence',
		5 => 'Machine Learning',
		6 => 'Data Engineering',
		7 => 'Pattern Recognition',
		8 => 'Data Warehousing',
		9 => 'Big Data',
		10 => 'Probability Models',
		11 => 'Signal Processing',
		12 => 'Science',
		13 => 'Tool',
		14 => 'Field',
		15 => 'Statistics',
		16 => 'Uncertainty Study',
		17 => 'Modeling',
		18 => 'Automation'
	}

	def clean_associated_areas
		(self.associated_areas||[]).compact.collect{|aa| aa.to_i} rescue []
	end

	def associated_areas_name
		self.associated_areas_list.join(', ')
	end

	def associated_areas_list
		self.clean_associated_areas.collect{|aa| ASSOCIATED_AREAS[aa]}.compact
	end
end
