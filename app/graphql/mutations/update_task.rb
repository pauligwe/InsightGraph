module Mutations
  class UpdateTask < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :status, String, required: false
    argument :due_date, GraphQL::Types::ISO8601Date, required: false
    argument :metadata, GraphQL::Types::JSON, required: false
    argument :project_id, ID, required: false
    argument :assignee_id, ID, required: false

    field :task, Types::TaskType, null: true
    field :errors, [String], null: false

    def resolve(id:, **attributes)
      task = Task.find_by(id: id)

      return { task: nil, errors: ["Task not found"] } if task.nil?

      if task.update(attributes.compact)
        { task: task, errors: [] }
      else
        { task: nil, errors: task.errors.full_messages }
      end
    end
  end
end