class Task < ActiveRecord::Base
  belongs_to :list

  after_create :set_default_state

  protected

  def set_default_state
    self.completed = false
  end

end
