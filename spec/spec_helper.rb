$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mf_cloud/invoice'
require 'webmock/rspec'
require 'rspec-parameterized'
require 'pry'

RSpec.configure do |c|
  c.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true unless meta.key?(:aggregate_failures)
  end
end
