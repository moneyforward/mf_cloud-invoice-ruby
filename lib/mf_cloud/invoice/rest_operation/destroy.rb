# frozen_string_literal: true

require 'active_support/concern'

module MfCloud
  module Invoice
    module RestOperation
      module Destroy
        extend ActiveSupport::Concern

        def destroy
          self.class.request(self.class.destroy_path(id), :delete)
        end

        class_methods do
          def destroy_path(id)
            single_path(id)
          end
        end
      end
    end
  end
end
