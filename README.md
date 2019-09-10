# mf_cloud-invoice-ruby [![Build Status](https://travis-ci.org/moneyforward/mf_cloud-invoice-ruby.svg?branch=master)](https://travis-ci.org/moneyforward/mf_cloud-invoice-ruby) [![Code Climate](https://codeclimate.com/github/moneyforward/mf_cloud-invoice-ruby/badges/gpa.svg)](https://codeclimate.com/github/moneyforward/mf_cloud-invoice-ruby)

[MFクラウド請求書API](https://invoice.moneyforward.com/api/v2/swagger_ui) client library for Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mf_cloud-invoice'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mf_cloud-invoice

## Usage

### Build client
```ruby
require 'mf_cloud/invoice'

client = MfCloud::Invoice::Client.new(access_token: 'YOUR_ACCESS_TOKEN')

# or

client = MfCloud::Invoice::Client.new do |client|
  client.access_token = 'YOUR_ACCESS_TOKEN'
end

client.billings.all
#=> Your Billings
```

### Basic usage

#### Office
```ruby
# get information
office = client.office.get #=> returns MfCloud::Invoice::Model::Office instance

p office.name # you can access parameters using getter method
#=> 'Sample office'

# update information
params = {
  name: 'section9',
  zip:  '101-1111'
}

updated_office = client.office.update(params)
p updated_office.name
#=> 'section9'

p updated_office.zip
#=> '101-1111'
```

#### Billings
```ruby
# get all billings(all, but using paging)
billings = client.billings.all #=> returns MfCloud::Invoice::Collection::BillingCollection instance

p billings.count # MfCloud::Invoice::Collection::BillingCollection can receive methods of Array
#=> 3

p billings.meta.current_page # meta has parameters of meta data(ex. paging parameter)
#=> 1

billings = client.billings.all(page: 2) # you can pass paging parameter
p billings.meta.current_page # meta has parameters of meta data(ex. paging parameter)
#=> 2

# get billing specified by id
billing = client.billings.get(id)
#=> returns MfCloud::Invoice::Model::Billing instance

p billing.total_price # you can access parameters using getter method
#=> '10000'

# create new billing
client.billings.create(params_hash)

# update billing
client.billings.update(id, params_hash) # NOTE: params_hash does not need id

# delete billing
client.billings.delete(id)
#=> true
```

About available parameters, see [API doc](https://github.com/moneyforward/invoice-api-doc#請求書api)

#### Partners
```ruby
# get all partners(all, but using paging)
partners = client.partners.all #=> returns MfCloud::Invoice::Collection::PartnerCollection instance

p partners.count # MfCloud::Invoice::Collection::PartnerCollection can receive methods of Array
#=> 3

p partners.meta.current_page # meta has parameters of meta data(ex. paging parameter)
#=> 1

partners = client.partners.all(page: 2) # you can pass paging parameter
p partners.meta.current_page # meta has parameters of meta data(ex. paging parameter)
#=> 2

# get partner specified by id
partner = client.partners.get(id)
#=> returns MfCloud::Invoice::Model::Partner instance

p partner.name # you can access parameters using getter method
#=> 'sample name'

# create new partner
client.partners.create(params_hash)

# update partner
client.partners.update(id, params_hash) # NOTE: params_hash does not need id

# delete partner
client.partners.delete(id)
#=> true
```

About available parameters, see [API doc](https://github.com/moneyforward/invoice-api-doc#取引先api)

#### Items
```ruby
# get all items(all, but using paging)
items = client.items.all #=> returns MfCloud::Invoice::Collection::ItemCollection instance

p items.count # MfCloud::Invoice::Collection::ItemCollection can receive methods of Array
#=> 3

p items.meta.current_page # meta has parameters of meta data(ex. paging parameter)
#=> 1

items = client.items.all(page: 2) # you can pass paging parameter
p items.meta.current_page # meta has parameters of meta data(ex. paging parameter)
#=> 2

# get item specified by id
item = client.items.get(id)
#=> returns MfCloud::Invoice::Model::Item instance

p item.price # you can access parameters using getter method
#=> 100

# create new item
client.items.create(params_hash)

# update item
client.items.update(id, params_hash) # NOTE: params_hash does not need id

# delete item
client.items.delete(id)
#=> true
```

About available parameters, see [API doc](https://github.com/moneyforward/invoice-api-doc#品目api)

### Errors
* MfCloud::Invoice::InvalidAccessToken
Access token is nil or invalid or expired.

* MfCloud::Invoice::PaymentRequired
The number of object is over than payment plan limit.
For example, when using Starter plan, number of partner limit is 3.
See [plan detail](https://invoice.moneyforward.com/pricing).

* MfCloud::Invoice::InvalidRequest
Parameter is collect but validation is not passed.

* MfCloud::Invoice::ResourceNotFound
Request id is invalid. This raises not only request resouce id, also id in parameters(For example, department_id when updating a billing).

* MfCloud::Invoice::InvalidParameter
Parameter format is invalid or necessaly parameter is missing.

* MfCloud::Invoice::RateLimitted
Up to rate limit.
See [here](https://github.com/moneyforward/invoice-api-doc#プランごとの利用制限について)

* MfCloud::Invoice::InternalServerError
Unexpected error has happen. Almost case it's success sometime later. Almost case, it will be success some time later. Please try few minits later.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/moneyforward/mf_cloud-invoice.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
