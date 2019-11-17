# CURLs
```
curl -H 'Content-Type: application/json' -H 'Authorization: Bearer cdedcf89f1d910ad68f5f969e1a748da0a6610fa8819ea27621c9147a69391c1587c785da8a407ca0a17bf81cd91cfe15ed0ea71f6c8287f60f2342f602993e4' http://localhost:3000/api/v1/invoices

curl -H 'Content-Type: application/json' -H 'Authorization: Bearer ebc320b0eda15d28e01792ff073fffed392d52741176b609c35d2313a9415ea81d50debd2aaf94ec5eba741ec4d9d8018c0c2c408a9957ef77ba6b6693e8e121' http://localhost:3000/api/v1/settings

curl -X PUT -H 'Content-Type: application/json' -H 'Authorization: Bearer ebc320b0eda15d28e01792ff073fffed392d52741176b609c35d2313a9415ea81d50debd2aaf94ec5eba741ec4d9d8018c0c2c408a9957ef77ba6b6693e8e121' -d '{"setting": { "billing_process": "per_location"} }' http://localhost:3000/api/v1/settings/change

```
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
