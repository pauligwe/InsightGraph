module Mutations
  class UpdatePerson < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :role, String, required: false
    argument :metadata, GraphQL::Types::JSON, required: false

    field :person, Types::PersonType, null: true
    field :errors, [String], null: false

    def resolve(id:, **attributes)
      person = Person.find_by(id: id)
      return { person: nil, errors: ["Person not found"] } if person.nil?

      if person.update(attributes.compact)
        { person: person, errors: [] }
      else
        { person: nil, errors: person.errors.full_messages }
      end
    end
  end
end