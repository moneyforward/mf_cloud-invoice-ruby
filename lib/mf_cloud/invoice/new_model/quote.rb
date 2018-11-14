# frozen_string_literal: true

module MfCloud
  module Invoice
    module NewModel
      class Quote < Entity
        extend InitializeFromJsonapi

        include RestOperation

        define_rest_operations :list, :find, :create, :update, :destroy

        define_attributes \
          :quote_number,
          :title,
          :partner_name,
          :partner_detail,
          :office_name,
          :office_detail,
          :subtotal,
          :total_price,
          :excise_price,
          :note,
          :memo,
          :quote_date,
          :expired_date,
          :created_at,
          :updated_at,
          :operator_id,
          :partner_id,
          :department_id,
          :member_id,
          :member_name,
          :document_name,
          :partner_name_suffix,
          :tags,
          :pdf_url,
          :is_locked,
          :is_downloaded,
          :order_status,
          :transmit_status,
          :posting_status,
          :deduct_price

        # has_manyをメタプロさせるのはしんどいと判断したので各クラスが実装
        def initialize(attrs = {})
          @items_attributes = attrs.delete(:items_attributes)

          super(attrs)
        end

        def items
          return [] unless @items_attributes

          @items_attributes.map do |attrs|
            QuoteItem.new(attrs)
          end
        end
      end
    end
  end
end
