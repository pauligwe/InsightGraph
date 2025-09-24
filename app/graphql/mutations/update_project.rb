module Mutations
  class UpdateProject < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :description, String, required: false
    argument :status, String, required: false
    argument :metadata, GraphQL::Types::JSON, required: false

    field :project, Types::ProjectType, null: true
    field :errors, [String], null: false

    def resolve(id:, name: nil, description: nil, status: nil, metadata: nil)
      project = Project.find_by(id: id)
      return { project: nil, errors: ['Project not found'] } unless project

      if project.update(name: name, description: description, status: status, metadata: metadata)
        { project: project, errors: [] }
      else
        { project: nil, errors: project.errors.full_messages }
      end
    end
  end
end