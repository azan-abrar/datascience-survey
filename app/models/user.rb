class User < ActiveRecord::Base
  acts_as_taggable
  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?
  def set_default_role
    self.role ||= :user
  end
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
