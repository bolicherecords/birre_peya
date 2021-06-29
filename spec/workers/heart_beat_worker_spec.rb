require 'rails_helper'

describe HeartBeatWorker do
  subject(:worker) { described_class.new }

  describe '#perform' do
    let(:api) { double }
    let(:args) { ['CL'] }

    before do
      allow(Api).to receive(:new).with(args).and_return(api)
      allow(api).to receive(:heart_beat).and_return(nil)
    end

    it 'calls heart beat method' do
      worker.perform(*args)
      expect(api).to have_received(:heart_beat).once
    end
  end
end
