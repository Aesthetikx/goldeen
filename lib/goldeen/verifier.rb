require 'goldeen/verifiers/json_verifier'

module Goldeen
  module Verifier
    REGISTRY = {
      json: Verifiers::JsonVerifier,
    }

    class << self
      def for(format)
        REGISTRY[format]
      end
    end
  end
end
