module Mutations
  class CreatePerson < BaseMutation
    argument :name, String, required: true
    argument :role, String, required: true

    field :person, Types::PersonType, null: true
    field :errors, [String], null: false

    def resolve(name:, role:)
      person = Person.new(name: name, role: role)

      if person.save
        { person: person, errors: [] }
      else
        { person: nil, errors: person.errors.full_messages }
      end
    end
  end
end
