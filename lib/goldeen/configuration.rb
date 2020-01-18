require 'singleton'

module Goldeen

  class << self
    def configure(&block)
      block.call Goldeen::Configuration.instance
    end

    def configuration
      Goldeen::Configuration.instance
    end
  end

  class Configuration
    include Singleton

    attr_writer :approvals_path
    attr_writer :excluded_json_keys

    def approvals_path
      @approvals_path ||= 'fixtures/goldeen/'
    end

    def excluded_json_keys
      @excluded_json_keys ||= {}
    end
  end
end
