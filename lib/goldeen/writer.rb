require 'goldeen/writers/text_writer'
require 'goldeen/writers/array_writer'
require 'goldeen/writers/hash_writer'
require 'goldeen/writers/html_writer'
require 'goldeen/writers/xml_writer'
require 'goldeen/writers/json_writer'
require 'goldeen/writers/binary_writer'

module Goldeen
  module Writer
    extend Writers

    REGISTRY = {
      json: Writers::JsonWriter.new,
      xml: Writers::XmlWriter.new,
      html: Writers::HtmlWriter.new,
      hash: Writers::HashWriter.new,
      array: Writers::ArrayWriter.new,
      txt: Writers::TextWriter.new,
    }


    class << self
      def for(format)
        begin
          REGISTRY[format] || Object.const_get(format).new
        rescue NameError => e
          error = ApprovalError.new(
            "Approval Error: #{ e }. Please define a custom writer as outlined"\
            " in README section 'Customizing formatted output': "\
            "https://github.com/kytrinyx/approvals#customizing-formatted-output"
          )
          raise error
        end
      end
    end

  end
end
