# frozen_string_literal: true

require 'command_line_reporter'

module Unbabel
  module CLI
    class Reporter
      include CommandLineReporter
      attr_accessor :data

      def initialize(data)
        self.data = data
      end

      def run
        table(border: true) do
          row(header: true) do
            column('DATE', width: 25)
            column('AVERAGE DELIVERY TIME', width: 25)
          end

          data.each { |line| add_row(line) }
        end
      end

      private

      def add_row(line)
        row do
          column(line[:date].strftime('%Y-%m-%d %H:%M:%S'))
          column(line[:average_delivery_time])
        end
      end
    end
  end
end
