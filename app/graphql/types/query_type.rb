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
      argument :age, Integer, required: false
      argument :role, String, required: false
    end

    def people(age: nil, role: nil)
      scope = Person.all
      scope = scope.where(age: age) if age.present?
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
      argument :statuses, [String], required: false
    end

    def projects(statuses: nil)
      scope = Project.all
      scope = scope.where(status: statuses) if statuses.present?
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
      argument :statuses, [String], required: false 
      argument :project_id, ID, required: false
    end

    def tasks(statuses: nil, project_id: nil)
      scope = Task.all
      scope = scope.where(status: statuses) if statuses.present?
      scope = scope.where(project_id: project_id) if project_id.present?
      scope
    end
  end
end