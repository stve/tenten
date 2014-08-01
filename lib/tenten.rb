require 'tenten/encoder'
require 'tenten/decoder'

module TenTen
  ALPHABET = 'ABCDEFGHJKMNPQRVWXY0123456789'
  BASE = ALPHABET.length

  class InvalidCodeError < StandardError ; end

  def encode(*coords)
    Encoder.new(*coords).encode
  end
  module_function :encode

  def decode(code)
    Decoder.new(code).decode
  end
  module_function :decode
end

Tenten = TenTen
