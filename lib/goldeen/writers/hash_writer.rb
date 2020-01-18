module Goldeen
  module Writers
    class HashWriter < TextWriter

      def format(data)
        lines = filter(data).map do |key, value|
          "\t#{key.inspect} => #{value.inspect}"
        end.join("\n")

        "{\n#{lines}\n}\n"
      end

      def filter data
        filter = ::Goldeen::Filter.new(Goldeen.configuration.excluded_json_keys)
        filter.apply(data)
      end

    end
  end
end
