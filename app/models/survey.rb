class Survey < ActiveRecord::Base
	validates :area_of_expertise, :step, presence: true
	validates :definition, :papers, presence: true, if: 'step>1'
	validates :big_data_vs_data_science, :machine_learning_vs_data_science, :stat_vs_data_science, presence: true, if: 'step>2'
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, if: "email&&email!=''"
	validates :access_token, uniqueness: {case_sensitive: false}, presence: true
	ABOUT_YOU = 1
	DEFINING = 2
	DIFFERENTIATION = 3
	STEPS = {ABOUT_YOU => 'About You', DEFINING => 'Definition', DIFFERENTIATION => 'Differentiation'}
	validates :step, inclusion: { in: STEPS.keys }
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

	DEGREE_LEVELS = {1 => 'Ph.D', 2 => 'M.S.', 3 => 'B.S.'}
	PROFESSIONS = {1 => 'Academic', 2 => 'Industry'}
	DISCIPLINES = {1 => 'Computer Science', 2 => 'Electrical', 3 => 'Mechanical',
		4 => 'Physics', 5 => 'Arts', 6 => 'Chemistry'}
	EXPERIENCE_LEVELS = {1 => '1-5 Years', 2 => '5-10 Years', 3 => '10-15 Years'}

	before_validation :set_fields

	def clean_associated_areas
		(self.associated_areas||[]).compact.collect{|aa| aa.to_i} rescue []
	end

	def associated_areas_name
		self.associated_areas_list.join(', ')
	end

	def associated_areas_list
		self.clean_associated_areas.collect{|aa| ASSOCIATED_AREAS[aa]}.compact
	end

	def degree_level_name
		DEGREE_LEVELS[self.degree_level]
	end

	def profession_name
		PROFESSIONS[self.profession]
	end

	def discipline_name
		DISCIPLINES[self.discipline]
	end

	def experience_level_name
		EXPERIENCE_LEVELS[self.experience_level]
	end

	def step_name
		STEPS[self.step]
	end

	def full_name
		"#{self.name}#{" (#{self.email})" if self.email.present?}"
	end

	private
	def set_fields
		self.access_token||=Digest::MD5.hexdigest("#{self.name}-#{Time.now.to_i}")
	end
end
