module TenTen
  class Decoder

    attr_accessor :code

    def initialize(code)
      @code = code
    end

    def decode
      raise TenTen::InvalidCodeError unless @code && @code.length == 12

      @code.gsub!(/\s/, '')

      tt_num = 0

      @code.chars.each do |char|
        tt_num *= TenTen::BASE

        if((index = TenTen::ALPHABET.index(char)) > 0)
          tt_num += index
        end
      end

      p     = tt_num / TenTen::BASE
      check = tt_num % TenTen::BASE

      lon = (p % 3600000).to_f
      lat = (p / 3600000).to_f

      lat = lat / 10000
      lon = lon / 10000

      lat -= 90
      lon -= 180

      c = 0
      (1..9).each do |index|
        c += (p % TenTen::BASE) * index
        p = ( p / TenTen::BASE ).floor
      end

      c = c % TenTen::BASE

      raise InvalidCodeError unless c == check

      [lat.round(4), lon.round(4)]
    end
  end
end
