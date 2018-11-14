# frozen_string_literal: true

module MfCloud
  module Invoice
    module NewModel
      class BillingItem < Entity
        extend InitializeFromJsonapi

        define_attributes \
          :item_code,
          :name,
          :detail,
          :quantity,
          :unit_price,
          :unit,
          :price,
          :is_excise,
          :disp_order,
          :created_at,
          :updated_at,
          :is_deduct
      end
    end
  end
end
