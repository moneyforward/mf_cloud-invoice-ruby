# frozen_string_literal: true

module MfCloud
  module Invoice
    module NewModel
      class SentHistory < Entity
        extend InitializeFromJsonapi

        include RestOperation

        define_rest_operations :list

        define_attributes \
          :operator_id,
          :type,
          :document_type,
          :document_id,
          :from,
          :to,
          :cc,
          :sent_at
      end
    end
  end
end
