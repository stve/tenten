RSpec.describe TenTen::Encoder do
  describe '#encode' do
    it 'encodes coordinates to a 10:10 code' do
      expect(described_class.new(10.0, 10.0).encode).to eq('HF1 GNP 6228')
      expect(described_class.new(53.5638, 10.0053).encode).to eq('MKX 4C2 E4WH')
      expect(described_class.new(51.09559, 1.12207).encode).to eq('MEQ N6G 7NY5')
    end
  end
end
