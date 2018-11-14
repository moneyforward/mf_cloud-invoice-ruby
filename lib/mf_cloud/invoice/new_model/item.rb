# frozen_string_literal: true

module MfCloud
  module Invoice
    module NewModel
      class Item < Entity
        extend InitializeFromJsonapi

        include RestOperation

        define_rest_operations :list, :find, :create, :update, :destroy

        define_attributes \
          :item_code,
          :name,
          :detail,
          :quantity,
          :unit_price,
          :unit,
          :price,
          :is_excise,
          :created_at,
          :updated_at,
          :is_deduct
      end
    end
  end
end
