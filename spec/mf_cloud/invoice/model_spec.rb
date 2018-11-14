# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MfCloud::Invoice::Entity do
  describe '#define_attributes' do
    let(:klass) { Class.new(described_class) }

    it 'defines reader' do
      expect { klass.__send__(:define_attributes, :hoge) }.to change { klass.public_method_defined?('hoge') }.from(false).to(true)
    end

    it 'defines writer' do
      expect { klass.__send__(:define_attributes, :hoge) }.to change { klass.public_method_defined?('hoge=') }.from(false).to(true)
    end
  end
end
