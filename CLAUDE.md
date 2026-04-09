# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Teahour 2.0 -- a Ruby on Rails 8.0 podcast platform (service name: `casmitter`). Chinese-language tech podcast hosted at teahour.dev. Rails stack with Turbo, Stimulus, Tailwind CSS 4, Propshaft.

## Common Commands

```bash
# Dev server
bin/rails server
bin/rails tailwindcss:watch          # asset file watcher (separate terminal)

# Tests
bin/rails test                       # all tests (except system)
bin/rails test test/models/episode_test.rb       # single file
bin/rails test test/models/episode_test.rb:27    # single test by line

# Lint
bundle exec rubocop                  # check
bundle exec rubocop -a               # safe auto-fix
bundle exec brakeman                 # security scan

# Episode management (rake tasks in lib/tasks/publish.rake)
bin/rails publish:episode_N          # publish episode N
bin/rails publish:delete_episode_N   # delete episode N

# DB
bin/rails db:seed                    # seeds episode 1 + hosts (destructive: deletes all first)
bin/rails db:migrate
```

## Architecture

### Data Model

- **Episode**: status enum (draft:0, published:1, hidden:2), looked up by `slug` OR `number` (see `EpisodesController#set_episode`). `length` = file size in bytes, `duration` = seconds.
- **Attendee**: STI base class. Subtypes: **Host**, **Guest**. Stores `social_links` as JSON via `ActiveRecord::Store`.
- **Attendance**: join table between Episode and Attendee. `role` enum (host:0, guest:1).
- **User/Session**: auth scaffolded with bcrypt but routes are commented out -- not active.

### Episode Publishing Flow

Episode 1 is created via `db/seeds.rb`. Episodes 2+ each have a dedicated rake task in `lib/tasks/publish.rake`. Each task:
1. Looks up existing Hosts/Guests (creates Guest if new)
2. Fetches remote file size via `FileUtils.get_remote_file_size` (HTTP HEAD request)
3. Creates Episode with description read from `db/seeds/episode_N_desc.md` (markdown)
4. Creates Attendance records linking hosts/guests

### RSS Feed

`/feed` and `/rss` routes serve `episodes/index.rss.builder` -- iTunes/Google Play compatible RSS with `itunes:*` and `googleplay:*` namespace tags. Episode descriptions rendered as HTML via Redcarpet markdown.

### Key Patterns

- **`lib/file_utils.rb`**: Custom `FileUtils` module (shadows Ruby stdlib's `FileUtils`) with `get_remote_file_size(url)` -- uses `Net::HTTP::Head` to get Content-Length.
- **Episode descriptions**: Stored as markdown in `db/seeds/episode_N_desc.md`, rendered via Redcarpet at publish time and in RSS feed.
- **Routes are read-only**: Only `show` and `index` for episodes/hosts/guests. No create/edit/delete via web.

### Deployment

Kamal with Docker, targeting amd64. Production uses PostgreSQL. Dev/test uses SQLite3.
