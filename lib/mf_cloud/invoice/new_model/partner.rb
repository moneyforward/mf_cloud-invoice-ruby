# frozen_string_literal: true

module MfCloud
  module Invoice
    module NewModel
      class Partner < Entity
        extend InitializeFromJsonapi

        include RestOperation

        define_rest_operations :list, :find, :create, :update, :destroy

        define_attributes \
          :code,
          :name,
          :name_kana,
          :name_suffix,
          :memo,
          :created_at,
          :updated_at

        def initialize(attrs = {})
          @departments_attributes = attrs.delete(:departments_attributes)

          super(attrs)
        end

        def departments
          return [] unless @departments_attributes

          @departments_attributes.map do |attrs|
            Department.new(attrs)
          end
        end
      end
    end
  end
end
