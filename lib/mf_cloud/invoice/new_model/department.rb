# frozen_string_literal: true

module MfCloud
  module Invoice
    module NewModel
      class Department < Entity
        extend InitializeFromJsonapi

        define_attributes \
          :zip,
          :tel,
          :prefecture,
          :address1,
          :address2,
          :person_name,
          :person_title,
          :name,
          :email,
          :cc_emails,
          :created_at,
          :updated_at,
          :id
      end
    end
  end
end
