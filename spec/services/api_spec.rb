require 'rails_helper'

describe Api do
  subject(:api) { described_class.new(params) }

  describe '#heart_beat' do
    let(:params) { ['CL'] }

    context 'when call the heartbeat method' do # rubocop:disable RSpec/MultipleMemoizedHelpers
      let(:credentials)     { double }
      let(:pedidos_ya_api)  { double }
      let(:event_api)       { double }
      let(:restaurant_api)  { double }
      let(:restaurants)     { [OpenStruct.new(id: nil)] }
      let(:options)         { double }
      let(:with_offset_api) { double }
      let(:options_next)    { double }

      before do
        allow(Credentials).to receive(:instance).with(params).and_return(credentials)
        allow(ReceptionSdk::ApiClient).to receive(:new).with(credentials)
                                                       .and_return(pedidos_ya_api)
        allow(pedidos_ya_api).to receive(:event).and_return(event_api)
        allow(event_api).to receive(:heart_beat).and_return(double)

        allow(ReceptionSdk::PaginationOptions).to receive(:create).and_return(options)
        allow(options).to receive(:with_limit).with(50).and_return(options)
        allow(pedidos_ya_api).to receive(:restaurant).and_return(restaurant_api)
        allow(restaurant_api).to receive(:get_all).with(options).and_return(restaurants)
        allow(options).to receive(:next).and_return(options_next)
        allow(restaurant_api).to receive(:get_all).with(options_next).and_return([])
      end

      describe 'when the country is Chile' do # rubocop:disable RSpec/MultipleMemoizedHelpers
        it 'calls heart_beat method on pedidos ya sdk once' do
          api.heart_beat
          expect(event_api).to have_received(:heart_beat).once
        end
      end

      describe 'when the country is Panama' do # rubocop:disable RSpec/MultipleMemoizedHelpers
        let(:params) { ['PA'] }

        it 'calls heart_beat method on pedidos ya sdk in Panama' do
          api.heart_beat
          expect(event_api).to have_received(:heart_beat).once
        end
      end
    end
  end
end
