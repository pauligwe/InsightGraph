module Types
  class MutationType < Types::BaseObject
    # Person mutations
    field :create_person, mutation: Mutations::CreatePerson
    field :update_person, mutation: Mutations::UpdatePerson
    field :delete_person, mutation: Mutations::DeletePerson
    
    # Project mutations
    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject
    field :delete_project, mutation: Mutations::DeleteProject
    
    # Task mutations
    field :create_task, mutation: Mutations::CreateTask
    field :update_task, mutation: Mutations::UpdateTask
    field :delete_task, mutation: Mutations::DeleteTask
  end
end
