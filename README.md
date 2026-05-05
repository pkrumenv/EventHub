# EventHub

**Group Members:**
- Simon Sapunar
- Pablo Krumenaker
- Renato Ilzauspe

EventHub is a Ruby on Rails application for managing events, registrations, and reviews. Users can browse events across different categories, register to attend them, and leave reviews once events are finished.

---

## Requirements

- Ruby 3.x
- Rails 8.1
- PostgreSQL
- Node.js & Yarn

---

## Setup Instructions

### 1. Clone the repository

```bash
git clone <repository-url>
cd EventHub2
```

### 2. Install Ruby dependencies

```bash
bundle install
```

### 3. Install JavaScript dependencies

```bash
yarn install
```

### 4. Configure the database

Make sure PostgreSQL is running on your machine. Then create and migrate the database:

```bash
rails db:create
rails db:migrate
```

### 5. Seed the database

Populate the database with sample data:

```bash
rails db:seed
```

This will create:
- 5 users
- 6 events (in `draft`, `published`, and `finished` states)
- 5 categories
- 13 registrations (in `pending`, `confirmed`, and `cancelled` states)
- 4 reviews (only on finished events)

### 6. Run the application

```bash
rails server
```

Then open your browser at [http://localhost:3000](http://localhost:3000).

---

## Data Model

The relational diagram is included in the repository as `EventHub_Data_Model.png`.

Main entities and their relationships:

- **User** — organizes events and can register to or review others
- **Event** — belongs to a user (organizer), has many registrations, reviews, and categories
- **Category** — associated to events through the `EventCategory` join table
- **Registration** — links a user to an event; has status (`pending`, `confirmed`, `cancelled`)
- **Review** — written by a user for a finished event; includes a rating (1–5) and a comment

---

## Repository Structure

```
EventHub2/
├── app/
│   ├── controllers/    # Events, Users, Categories, Registrations, Reviews
│   ├── models/         # All models with associations and validations
│   └── views/          # index and show views for each entity
├── db/
│   ├── migrate/        # Database migrations
│   ├── schema.rb       # Current database schema
│   └── seeds.rb        # Sample data
├── config/
│   └── routes.rb       # Resourceful routes
├── EventHub_Data_Model.png  # Entity-relationship diagram
└── README.md
```

---

## Main Features

- Browse all events with their organizer and categories
- View event details including registrations and reviews
- Browse users and their activity
- Browse categories and associated events
- Navigate between all sections via the top navigation bar
- Bootstrap 5 styling throughout all views
