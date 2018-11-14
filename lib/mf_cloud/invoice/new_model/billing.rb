# frozen_string_literal: true

module MfCloud
  module Invoice
    module NewModel
      class Billing < Entity
        extend InitializeFromJsonapi

        include RestOperation

        define_rest_operations :list, :find, :create, :update, :destroy

        define_attributes \
          :pdf_url,
          :operator_id,
          :partner_id, :department_id,
          :member_id,
          :member_name,
          :partner_name,
          :partner_name_suffix,
          :partner_detail,
          :office_name,
          :office_detail,
          :title,
          :excise_price,
          :subtotal,
          :memo,
          :payment_condition,
          :total_price,
          :billing_date,
          :due_date,
          :sales_date,
          :billing_number,
          :note,
          :document_name,
          :payment_status,
          :email_status,
          :posting_status,
          :created_at,
          :updated_at,
          :deduct_price,
          :tags,
          :is_downloaded,
          :is_locked

        def initialize(attrs = {})
          @items_attributes = attrs.delete(:items_attributes)

          super(attrs)
        end

        def items
          return [] unless @items_attributes

          @items_attributes.map do |attrs|
            BillingItem.new(attrs)
          end
        end
      end
    end
  end
end
