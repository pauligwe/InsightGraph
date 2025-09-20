module Mutations
  class CreateProject < BaseMutation
    argument :name, String, required: true
    argument :description, String, required: false
    argument :status, String, required: false
    argument :metadata, GraphQL::Types::JSON, required: false

    field :project, Types::ProjectType, null: true
    field :errors, [String], null: false

    def resolve(name:, description: nil, status: nil, metadata: nil)
      project = Project.new(
        name: name,
        description: description,
        status: status,
        metadata: metadata
      )

      if project.save
        { project: project, errors: [] }
      else
        { project: nil, errors: project.errors.full_messages }
      end
    end
  end
end