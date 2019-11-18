# CURL usage

Fetch invoices for current_user and his companies
```
curl -H 'Content-Type: application/json' -H 'Authorization: Bearer cdedcf89f1d910ad68f5f969e1a748da0a6610fa8819ea27621c9147a69391c1587c785da8a407ca0a17bf81cd91cfe15ed0ea71f6c8287f60f2342f602993e4' http://localhost:3000/api/v1/invoices
```

Create (buy) new company for a current_user
```
curl -X PUT -H 'Content-Type: application/json' -H 'Authorization: Bearer ebc320b0eda15d28e01792ff073fffed392d52741176b609c35d2313a9415ea81d50debd2aaf94ec5eba741ec4d9d8018c0c2c408a9957ef77ba6b6693e8e121' -d '{"settings": { "billing_process": "per_company"} }' http://localhost:3000/api/v1/company/1
```

Update company for a current_user
```
curl -X POST -H 'Content-Type: application/json' -H 'Authorization: Bearer f8481d32a23af7960ceeed163b84d4d070fdcd3981f60f5618f5fcb5d8b90169c38d1a46772d3ae24cee280e4a266fe5d1b437bca787694d4c3d2434065014bf' -d '{"company": { "settings": { "billing_process": "per_company"}, "title": "Evgeny Company" } }' http://localhost:3000/api/v1/companies
```

## Installation

bundle install
bundle exec rake db:create db:migrate db:seed

## Running

bundle exec rails s

## Testing

bundle exec rspec
