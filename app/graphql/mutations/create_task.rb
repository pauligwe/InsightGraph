module Mutations
  class CreateTask < BaseMutation
    argument :title, String, required: true
    argument :status, String, required: false
    argument :due_date, GraphQL::Types::ISO8601Date, required: false
    argument :metadata, GraphQL::Types::JSON, required: false
    argument :project_id, ID, required: true
    argument :assignee_id, ID, required: true

    field :task, Types::TaskType, null: true
    field :errors, [String], null: false

    def resolve(title:, project_id:, assignee_id:, status: nil, due_date: nil, metadata: nil)
      task = Task.new(
        title: title,
        status: status,
        due_date: due_date,
        metadata: metadata,
        project_id: project_id,
        assignee_id: assignee_id
      )

      if task.save
        { task: task, errors: [] }
      else
        { task: nil, errors: task.errors.full_messages }
      end
    end
  end
end
