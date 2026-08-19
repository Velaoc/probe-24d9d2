<!-- foundation:identity -->
# probe-24d9d2

One-page guestbook: visitors type a short message and see the wall of messages, newest first.

- Site: https://probe-24d9d2.api.holode.xyz
- Support: support@probe-24d9d2.api.holode.xyz
<!-- /foundation:identity -->

## What this is

One-page guestbook: visitors type a short message and see the wall of messages, newest first.

## Who it is for

- visitor

## Main features

- **Post a message** — Type a short message, submit it, and see it appear at the top of the wall
- **Read the wall** — View all messages, newest first

## Core entities

- GuestbookEntry

## Run locally

```bash
bundle install
bin/rails db:prepare
bin/dev
```

Requires Ruby, PostgreSQL, and the usual Rails toolchain. See `bin/setup` if present.

## Demo

A few short sample messages so the wall has life on first load

## Deploy notes

Production `config.hosts` is derived from `domain` in `config/foundation.yml`. Keep that value aligned with the real host or every request will 403.
