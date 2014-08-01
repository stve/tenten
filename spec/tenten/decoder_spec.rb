RSpec.describe TenTen::Decoder do
  describe '#decode' do
    context 'with invalid code' do
      it 'raises an invalid code error' do
        expect {
          described_class.new('foobar').decode
        }.to raise_error(TenTen::InvalidCodeError)
      end
    end

    context 'with valid code' do
      it 'decodes a 10:10 code to coordinates' do
        expect(described_class.new('HF1 GNP 6228').decode).to eq([10.0, 10.0])
        expect(described_class.new('MKX 4C2 E4WH').decode).to eq([53.5638, 10.0053])
        expect(described_class.new('MEQ N6G 7NY5').decode).to eq([51.0955, 1.122])
      end
    end
  end
end
