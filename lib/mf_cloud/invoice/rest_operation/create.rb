# frozen_string_literal: true

module MfCloud
  module Invoice
    module RestOperation
      module Create
        def create(body)
          json = request(create_path, :post, body)
          jsonapi_response = Jsonapi::Response.new(json)
          new_from_jsonapi(jsonapi_response)
        end

        def create_path
          pluralize_path
        end
      end
    end
  end
end
