# frozen_string_literal: true

require 'json'

require 'active_support/core_ext/string/inflections'
require 'active_support/concern'

require_relative 'rest_operation/find'
require_relative 'rest_operation/create'
require_relative 'rest_operation/update'
require_relative 'rest_operation/list'
require_relative 'rest_operation/destroy'

module MfCloud
  module Invoice
    module RestOperation
      extend ActiveSupport::Concern

      class_methods do
        def define_rest_operations(*m)
          extend List if m.include? :list
          extend Find if m.include? :find
          extend Create if m.include? :create
          include Update if m.include? :update
          include Destroy if m.include? :destroy
        end

        def request(path, method = :get, body = {})
          res = case method
                when :get
                  client.get path
                when :post
                  client.post do |req|
                    req.url path
                    req.headers['Content-Type'] = 'application/json'
                    req.body = JSON.generate body
                  end
                when :patch
                  client.patch do |req|
                    req.url path
                    req.headers['Content-Type'] = 'application/json'
                    req.body = JSON.generate body
                  end
                when :put
                  client.put do |req|
                    req.url path
                    req.headers['Content-Type'] = 'application/json'
                    req.body = JSON.generate body
                  end
                when :delete
                  client.delete path
                else
                  raise NotImplementedError
                end

          return '' if res.body.empty?

          JSON.parse(res.body, symbolize_names: true)
        end

        private

        def resource_name
          name.demodulize.underscore
        end

        def pluralize_path
          resource_name.pluralize
        end

        def single_path(id)
          "#{pluralize_path}/#{id}"
        end

        def client
          Faraday.new(url: "#{API_URL}v2/") do |con|
            con.authorization :Bearer, '3c0841c46a4b75baa342529745d1696951b596c111113f95250ba1d31f837560'
            con.adapter  Faraday.default_adapter
          end
        end
      end
    end
  end
end
