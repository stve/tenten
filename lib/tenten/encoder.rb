module TenTen
  class Encoder

    attr_accessor :latitude, :longitude

    def initialize(lat, lon)
      @latitude = lat
      @longitude = lon
    end

    def encode
      lat = ((@latitude + 90.0) * 10000.0).floor
      lon = ((@longitude + 180.0) * 10000.0).floor

      p = lat * 3600000.0 + lon

      tt_num = p * TenTen::BASE
      c = 0

      (1..10).each do |index|
        c += (p % TenTen::BASE) * index
        p = ( p / TenTen::BASE ).floor
      end

      tt_num = tt_num + (c % TenTen::BASE)
      tt_num = tt_num.floor

      (0..9).inject('') do |tt, index|
        tt.prepend(' ') if [4, 7].include?(index)
        tt.prepend(TenTen::ALPHABET[tt_num % TenTen::BASE])
        tt_num = (tt_num / TenTen::BASE).floor

        tt
      end
    end

  end
end
