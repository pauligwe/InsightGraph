module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :status, String, null: true
    field :due_date, GraphQL::Types::ISO8601Date, null: true
    field :metadata, GraphQL::Types::JSON, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Associations
    field :project, Types::ProjectType, null: false
    field :assignee, Types::PersonType, null: false
  end
end