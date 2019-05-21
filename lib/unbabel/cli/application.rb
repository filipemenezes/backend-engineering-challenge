# frozen_string_literal: true

require 'thor'

module Unbabel
  module CLI
    class Application < Thor
      desc 'average [SOURCE_FILE]', 'Calculate moving average of SOURCE_FILE'
      option :window_size, type: :numeric, default: 10
      option :output_file, type: :string
      def average(source_file)
        input_stream = Unbabel::CLI::InputStream.new(source_file)

        output_data = Unbabel::CLI::MovingAverageCalculator.new(
          input_stream.read,
          options[:window_size]
        ).calculate

        if options[:output_file]
          Unbabel::CLI::OutputStream.new(output_data, options[:output_file]).write
        else
          Unbabel::CLI::Reporter.new(output_data).run
        end
      end
    end
  end
end
