# frozen_string_literal: true

module MfCloud
  module Invoice
    module NewModel
      class Office < Entity
        extend InitializeFromJsonapi

        include RestOperation

        define_rest_operations :find, :update

        define_attributes \
          :name,
          :zip,
          :prefecture,
          :address1,
          :address2,
          :tel,
          :fax

        class << self
          private

          def single_path(id = nil)
            'office'
          end
        end
      end
    end
  end
end
