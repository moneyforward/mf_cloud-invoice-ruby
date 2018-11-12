# frozen_string_literal: true

# Entity#newとjsonapiのインピーダンスミスマッチを解消するクラス
module MfCloud
  module Invoice
    module InitializeFromJsonapi
      def new_from_jsonapi(jsonapi_response)
        r = jsonapi_response.primary_resource
        initialize_single_resource(r, jsonapi_response)
      end

      def list_from_jsonapi(jsonapi_response)
        jsonapi_response.primary_list.map do |r|
          initialize_single_resource(r, jsonapi_response)
        end
      end

      private

      def initialize_single_resource(resource, response)
        if resource.relationships
          relation_attributes = resource.relationships.each_key.with_object({}) do |name, hash|
            relationship_resources = resource.select_relationship_resources(name, response.included_resources)
            hash["#{name}_attributes".to_sym] = relationship_resources.map do |r|
              r.attributes.merge(id: r.id)
            end
          end
          attrs = resource.attributes.merge(id: resource.id).merge(**relation_attributes)
        else
          attrs = resource.attributes.merge(id: resource.id)
        end

        new(attrs)
      end
    end
  end
end
