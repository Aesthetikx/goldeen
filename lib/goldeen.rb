require 'json'
require 'fileutils'
require 'nokogiri'
require 'goldeen/version'
require 'goldeen/configuration'
require 'goldeen/approval'
require 'goldeen/dsl'
require 'goldeen/error'
require 'goldeen/system_command'
require 'goldeen/scrubber'
require 'goldeen/dotfile'
require 'goldeen/executable'
require 'goldeen/reporters'
require 'goldeen/filter'
require 'goldeen/writer'
require 'goldeen/verifier'
require 'goldeen/namers/default_namer'

module Goldeen
  extend DSL

  class << self

    def project_dir
      @project_dir ||= FileUtils.pwd
    end

    def reset
      Dotfile.reset
    end
  end
end

Goldeen.reset
