# frozen_string_literal: true

module Unbabel
  module CLI
    class InputStream
      attr_accessor :source_file

      def initialize(source_file)
        self.source_file = source_file
      end

      def read
        lines = File.foreach(source_file).map { |line| JSON.parse(line, symbolize_names: true) }
        lines.each { |line| line[:timestamp] = Time.parse(line[:timestamp]).change(sec: 0) }
        lines
      end
    end
  end
end
