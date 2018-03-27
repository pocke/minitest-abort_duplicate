require "minitest/abort_duplicate/version"

module Minitest
  module AbortDuplicate
    class << self
      attr_writer :files

      def files
        (defined?(@files) ? @files : Dir.glob('**/*')).map {|f| File.absolute_path(f) }
      end
    end

    module WarningMixin
      Warning.extend self

      def warn(message)
        if match = regexp.match(message)
          puts "abort: #{match[:method_name]} is redefined from #{match[:location]}. It conceals another test case. Rename this (or another) method name to avoid concealing!"
          exit 1
        end

        super
      end

      def regexp
        @regexp ||= /\A(?<location>#{Regexp.union(Minitest::AbortDuplicate.files)}:\d+): warning: method redefined; discarding old (?<method_name>test_.*)/
      end
    end
  end
end
