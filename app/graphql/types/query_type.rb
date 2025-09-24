# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Get one person
    field :person, Types::PersonType, null: true do
      argument :id, ID, required: true
    end

    def person(id:)
      Person.find_by(id: id)
    end

    # Get all people
    field :people, [Types::PersonType], null: true do
      argument :role, String, required: false
    end

    def people(role: nil)
      scope = Person.all
      scope = scope.where(role: role) if role.present?
      scope
    end

    # Get one project
    field :project, Types::ProjectType, null: true do
      argument :id, ID, required: true
    end

    def project(id:)
      Project.find_by(id: id)
    end

    # Get all projects
    field :projects, [Types::ProjectType], null: true do
      argument :status, [String], required: false
    end

    def projects(status: nil)
      scope = Project.all
      scope = scope.where(status: status) if status.present?
      scope
    end

    # Get one task
    field :task, Types::TaskType, null: true do
      argument :id, ID, required: true
    end

    def task(id:)
      Task.find_by(id: id)
    end
    
    # Get all tasks with filtering
    field :tasks, [Types::TaskType], null: true do
      argument :status, [String], required: false
      argument :project_id, ID, required: false
    end

    def tasks(status: nil, project_id: nil)
      scope = Task.all
      scope = scope.where(status: status) if status.present?
      scope = scope.where(project_id: project_id) if project_id.present?
      scope
    end
  end
end