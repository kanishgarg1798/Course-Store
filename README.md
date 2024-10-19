# Course Store

A web app for users to browse and buy courses. Integrated with Stripe for payment processing and webhook support to handle payment updates.

## Features
- Browse available courses
- Purchase courses using Stripe
- Webhook support to automatically update payment status

### Prerequisites
- Ruby 3.0
- Rails 7
- PostgreSQL
- Stripe account ( for payments )

## Getting Started

- Clone the repo:
- git clone https://github.com/kanishgarg1798/course-store.git
- cd course-store

- Install the required gems:
- bundle install

- rails db:create
- rails db:migrate

- Start the Rails server:
- rails s

### Stripe Setup

To integrate Stripe, set up your API keys in 'credentials.yml.enc' or environment variables:

- `STRIPE_API_KEY`
- `STRIPE_WEBHOOK_SECRET`

- To listen for Stripe webhooks, run the following command:
- ```bash
 stripe listen --forward-to localhost:3000/webhooks/stripe

## Testing

Use the Stripe test card number `4242 4242 4242 4242` with any valid expiration date and CVC to simulate purchases.