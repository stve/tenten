RSpec.describe TenTen do

  describe '#encode' do
    it 'decodes 10:10 codes' do
      expect(TenTen.encode(10.0, 10.0)).to eq('HF1 GNP 6228')
    end
  end

  describe '#decode' do
    it 'decodes 10:10 codes' do
      expect(TenTen.decode('HF1 GNP 6228')).to eq([10.0, 10.0])
    end
  end

end
