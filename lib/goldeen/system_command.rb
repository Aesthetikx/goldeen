module Goldeen

  module SystemCommand

    class << self
      def exists?(executable)
        `which #{executable}` != ""
      end
    end

  end

end
