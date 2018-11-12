# frozen_string_literal: true

module MfCloud
  module Invoice
    module Jsonapi
      class Response
        attr_accessor :data, :errors, :meta, :jsonapi, :links, :included

        def initialize(body)
          @data     = body[:data]
          @errors   = body[:errors]
          @meta     = body[:meta]
          @jsonapi  = body[:jsonapi]
          @links    = body[:links]
          @included = body[:included]
        end

        def primary_resource
          Resource.new(data)
        end

        def primary_list
          data.map { |d| Resource.new(d) }
        end

        def included_resources
          @included_resources ||= included.map { |i| Resource.new(i) }
        end
      end
    end
  end
end
