# Team & Project Management GraphQL API

A backend application built with **Ruby on Rails** and **GraphQL** for managing teams, projects, and tasks.

## Features

- **CRUD operations** for People, Projects, and Tasks
- **Dynamic queries** with filtering by status, role, or project
- **Associations**: Tasks belong to Projects and People; Projects have many Tasks; People have many Tasks
- **PostgreSQL JSONB** fields for flexible metadata storage
- **GraphQL API** ready for front-end or integration

## Workflow

### 1. Create People

```graphql
mutation {
  createPerson(name: "Alice Johnson", role: "Developer") {
    person { id name role }
    errors
  }
}
```

### 2. Create Projects
```graphql
mutation {
  createProject(
    name: "Website Redesign",
    description: "Update company website UI/UX",
    status: "active"
  ) {
    project { id name status }
    errors
  }
}
```

### 3. Create Tasks
```graphql
mutation {
  createTask(
    title: "Design landing page",
    status: "open",
    projectId: 1,
    assigneeId: 1
  ) {
    task { id title status project { name } assignee { name } }
  }
}
```

### 4. Query Tasks with Filters
```graphql
query {
  tasks(projectId: 1, status: ["open"]) {
    id
    title
    status
    project { name }
    assignee { name }
  }
}
```

### 5. Query People and Projects
```graphql
query {
  people(role: "Developer") {
    id
    name
    tasks { title status }
  }

  projects(status: ["active"]) {
    id
    name
    tasks { title assignee { name } }
  }
}
```
### Getting Started
```bash
git clone https://github.com/pauligwe/InsightGraph
cd InsightGraph
bundle install
rails db:create db:migrate
rails server
```

Use GraphiQL at http://localhost:3000/graphiql to interact with the API.
