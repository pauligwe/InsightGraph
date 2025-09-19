module Types
  class PersonType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :role, String, null: true
    field :metadata, GraphQL::Types::JSON, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Associations
    field :tasks, [Types::TaskType], null: true
    field :projects, [Types::ProjectType], null: true
  end
end