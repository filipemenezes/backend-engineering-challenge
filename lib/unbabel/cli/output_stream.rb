# frozen_string_literal: true

module Unbabel
  module CLI
    class OutputStream
      attr_accessor :stream, :output_file

      def initialize(stream, output_file)
        self.stream = format(stream)
        self.output_file = output_file
      end

      def write
        File.open(output_file, 'w') { |file| file.puts stream }
      end

      private

      def format(stream)
        stream.each { |line| line[:date] = line[:date].strftime('%Y-%m-%d %H:%M:%S') }
        stream.map(&:to_json)
      end
    end
  end
end
