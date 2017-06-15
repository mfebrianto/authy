# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

```
docker run --name postgres_authy -p 5432:5432 
-e POSTGRES_USER=admin -e POSTGRES_PASSWORD=password 
-e POSTGRES_DB=authy_dev -d postgres
```

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
