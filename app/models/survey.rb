class Survey < ActiveRecord::Base
	validates :definition, :papers, :area_of_expertise, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, if: "email&&email!=''"
end
