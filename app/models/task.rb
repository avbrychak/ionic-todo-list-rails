class Task < ActiveRecord::Base
  belongs_to :list

  after_create :set_defaults

  protected

  def set_defaults
    self.completed = false
    self.target_priority = 0
  end

end
