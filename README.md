# Rails 7 Todo App to learn Hotwire

## Setup

```bash
$ bundle install
$ docker-compose up --build
$ bin/rails db:create
$ bin/rails db:migrate RAILS_ENV=development
$ bin/rails db:migrate RAILS_ENV=test
```

## Launch

```bash
$ docker-compose up --build
$ bin/rails s
```

## Test

```bash
$ bundle exec rspec
```

## What I've learned

- [x] Simple.css
- [x] CRUD (Turbo)
- [x] Instant Search (Turbo, Stimulus)
- [x] Continuous scrolling (Turbo, Stimulus)
