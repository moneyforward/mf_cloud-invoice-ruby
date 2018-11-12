# frozen_string_literal: true

module MfCloud
  module Invoice
    module Jsonapi
      class Resource
        attr_reader :id, :attributes, :type, :relationships, :links, :meta

        def initialize(hash)
          @id            = hash[:id]
          @attributes    = hash[:attributes]
          @type          = hash[:type]
          @relationships = hash[:relationships]
          @links         = hash[:links]
          @meta          = hash[:meta]
        end

        def ==(o)
          self.id == o.id && self.type == o.type
        end

        def select_relationship_resources(name, included_resources)
          relationships[name.to_sym][:data].map do |data|
            r = self.class.new(data)
            included_resources.find { |i| i == r }
          end
        end
      end
    end
  end
end
