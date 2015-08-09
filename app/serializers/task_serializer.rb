class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :completed, :completed_at, :target_priority
end
