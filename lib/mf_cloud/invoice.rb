module MfCloud
  module Invoice
    API_URL = 'https://invoice.moneyforward.com/api/'
  end
end

require "mf_cloud/invoice/version"
require "mf_cloud/invoice/errors"
require "mf_cloud/invoice/client"
require "mf_cloud/invoice/configure"

require 'mf_cloud/invoice/entity'
require 'mf_cloud/invoice/jsonapi'
require 'mf_cloud/invoice/initialize_from_jsonapi'
require 'mf_cloud/invoice/rest_operation'
require 'mf_cloud/invoice/new_model'
