module Mutations
  class DeletePerson < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(id:)
      person = Person.find_by(id: id)

      return { success: false, errors: ["Person not found"] } if person.nil?
      
      if person.destroy
        { success: true, errors: [] }
      else
        { success: false, errors: person.errors.full_messages}
      end
    end
  end
end