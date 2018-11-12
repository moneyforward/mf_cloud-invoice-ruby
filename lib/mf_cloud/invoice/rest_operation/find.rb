# frozen_string_literal: true

require 'active_support/concern'

module MfCloud
  module Invoice
    module RestOperation
      module Find
        extend ActiveSupport::Concern

        def find(id)
          json = request(show_path(id))
          jsonapi_response = Jsonapi::Response.new(json)
          new_from_jsonapi(jsonapi_response)
        end

        def show_path(id)
          single_path(id)
        end
      end
    end
  end
end
