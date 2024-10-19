# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
3.0.0
* System dependencies

* Configuration

* Database creation
postgresql
* Database initialization

* How to run the test suite
rails s
stripe listen --forward-to localhost:3000/webhooks/stripe

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Command for listening the webhook events

stripe listen --forward-to localhost:3000/webhooks/stripe