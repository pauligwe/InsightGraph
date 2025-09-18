# frozen_string_literal: true

module Types
  class PersonType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :role, String
    field :metadata, GraphQL::Types::JSON
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
