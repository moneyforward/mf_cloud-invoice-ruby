# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MfCloud::Invoice::NewModel::Quote do
  shared_examples 'rest_api' do
    describe '#list' do
      before do
        stub_request(:get, MfCloud::Invoice::API_URL + 'v2/quotes').
          with(
            headers: {
              'Authorization'=>'Bearer 3c0841c46a4b75baa342529745d1696951b596c111113f95250ba1d31f837560'
            }
        ).
        to_return(status: 200, body: File.open('sample1.txt') {|f| f.read}.chomp, headers: {})
      end

      subject { described_class.list }
      let(:expected_array) do
        [described_class.new(title: :hoge), described_class.new(title: :fuga)]
      end

      it do
        expect(subject.all? { |i| i.is_a?(described_class) }).to be true
      end
    end

    describe '#find' do
      before do
        stub_request(:get, MfCloud::Invoice::API_URL + 'v2/quotes/N5yLO_aNpvuekQdvLI_ptA').
          with(
            headers: {
              'Authorization'=>'Bearer 3c0841c46a4b75baa342529745d1696951b596c111113f95250ba1d31f837560'
            }
        ).
        to_return(status: 200, body: File.open('show.json') {|f| f.read}.chomp, headers: {})
      end

      subject { described_class.find('N5yLO_aNpvuekQdvLI_ptA') }

      it { is_expected.to be_a described_class }
      it do
        expect(subject.items.all? { |i| i.is_a?(MfCloud::Invoice::NewModel::QuoteItem) }).to be true
      end
      it do
        expect(subject.items.count).to eq 2
      end

      it do
        expect(subject.items.last.name).to eq 'マークアウト'
      end
    end

    describe '#create' do
      before do
        stub_request(:post, MfCloud::Invoice::API_URL + 'v2/quotes').
          with(
            headers: {
              'Authorization'=>'Bearer 3c0841c46a4b75baa342529745d1696951b596c111113f95250ba1d31f837560'
            },
            body: params
        ).
        to_return(status: 200, body: File.open('show.json') {|f| f.read}.chomp, headers: {})
      end

      let(:params) do
        {
          quote: {
            department_id: 'hogehoge'
          }
        }
      end
      subject { described_class.create(params) }

      it { is_expected.to be_a described_class }
      it do
        expect(subject.items.all? { |i| i.is_a?(MfCloud::Invoice::NewModel::QuoteItem) }).to be true
      end
      it do
        expect(subject.items.count).to eq 2
      end

      it do
        expect(subject.items.last.name).to eq 'マークアウト'
      end
    end

    describe '#update' do
      before do
        stub_request(:patch, MfCloud::Invoice::API_URL + "v2/quotes/#{instance.id}").
          with(
            headers: {
              'Authorization'=>'Bearer 3c0841c46a4b75baa342529745d1696951b596c111113f95250ba1d31f837560'
            },
            body: params
        ).
        to_return(status: 200, body: File.open('show.json') {|f| f.read}.chomp, headers: {})
      end

      let(:params) do
        {
          quote: {
            title: 'hogehoge'
          }
        }
      end
      let(:instance) { described_class.new(id: 'hoge') }
      subject { instance.update(params) }

      it { is_expected.to be_a described_class }
      it do
        expect(subject.items.all? { |i| i.is_a?(MfCloud::Invoice::NewModel::QuoteItem) }).to be true
      end
      it do
        expect(subject.items.count).to eq 2
      end

      it do
        expect(subject.items.last.name).to eq 'マークアウト'
      end
    end

    describe '#destroy' do
      before do
        stub_request(:delete, MfCloud::Invoice::API_URL + "v2/quotes/#{instance.id}").
          with(
            headers: {
              'Authorization'=>'Bearer 3c0841c46a4b75baa342529745d1696951b596c111113f95250ba1d31f837560'
            }
        ).
        to_return(status: 200, body: '', headers: {})
      end

      let(:instance) { described_class.new(id: 'hoge') }
      subject { instance.destroy }

      it { is_expected.to eq '' }
    end
  end

  it_behaves_like 'rest_api'
end
