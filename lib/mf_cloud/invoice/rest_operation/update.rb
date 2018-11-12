# frozen_string_literal: true

require 'active_support/concern'

module MfCloud
  module Invoice
    module RestOperation
      module Update
        extend ActiveSupport::Concern

        def update(body)
          json = self.class.request(self.class.update_path(id), :patch, body)
          jsonapi_response = Jsonapi::Response.new(json)
          self.class.new_from_jsonapi(jsonapi_response)
        end

        class_methods do
          def update_path(id)
            single_path(id)
          end
        end
      end
    end
  end
end
