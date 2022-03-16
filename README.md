# Jungle

A mini e-commerce application built with Rails 4.2.

## Features
- Jungle is a simple e-commerce application with many levels of authentication.
- Admin authentication for adding new categories and new products.
- Can browse and "purchase" items as a visitor, or as a user.


!["Jungle Home Page"](https://github.com/adrianetodesign/jungle-rails/blob/master/docs/homepage.png)

!["Jungle Product Page"](https://github.com/adrianetodesign/jungle-rails/blob/master/docs/productpage.png)

!["Junge Category Page"](https://github.com/adrianetodesign/jungle-rails/blob/master/docs/categorypage.png)

## Getting Started

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
