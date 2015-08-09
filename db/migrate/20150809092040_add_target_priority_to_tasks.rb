class AddTargetPriorityToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :target_priority, :integer
  end
end
