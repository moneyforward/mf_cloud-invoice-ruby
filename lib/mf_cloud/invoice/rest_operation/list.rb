# frozen_string_literal: true

module MfCloud
  module Invoice
    module RestOperation
      module List
        def list
          json = request(index_path)
          jsonapi_response = Jsonapi::Response.new(json)
          list_from_jsonapi(jsonapi_response)
        end

        def index_path
          pluralize_path
        end
      end
    end
  end
end
