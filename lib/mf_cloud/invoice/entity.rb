# frozen_string_literal: true

module MfCloud
  module Invoice
    class Entity
      class << self
        attr_reader :attribute_names

        private

        def define_attributes(*attr_names)
          names = attr_names.map(&:to_sym)

          names.each do |attr_name|
            reader_method_name = attr_name.to_s
            writer_method_name = "#{reader_method_name}="

            define_method(reader_method_name) {     attributes[attr_name]     } unless public_method_defined?(reader_method_name)
            define_method(writer_method_name) { |v| attributes[attr_name] = v } unless public_method_defined?(writer_method_name)
          end

          @attribute_names ||= []
          @attribute_names += names
        end
      end

      attr_reader :id, :attributes

      def initialize(attrs = {})
        @id = attrs.delete(:id)
        @attributes = attrs.slice(*self.class.attribute_names)
      end
    end
  end
end
