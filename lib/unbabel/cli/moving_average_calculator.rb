# frozen_string_literal: true

module Unbabel
  module CLI
    class MovingAverageCalculator
      attr_accessor :input_stream, :output_stream, :window_size

      def initialize(input_stream, window_size)
        self.input_stream = input_stream
        self.window_size = window_size
        self.output_stream = []
      end

      def calculate
        cursor_timestamp = input_stream.first[:timestamp]
        final_timestamp = input_stream.last[:timestamp] + 1.minute

        while cursor_timestamp <= final_timestamp
          append_to_output_stream(cursor_timestamp, moving_average(cursor_timestamp))
          cursor_timestamp += 1.minute
        end

        output_stream
      end

      private

      def moving_average(_timestamp)
        average = 0

        window = output_stream.last(window_size).pluck(:date)
        durations = filter_valid_durations(window)
        average = (durations.sum / durations.length.to_f) if durations.any?

        average
      end

      def append_to_output_stream(timestamp, average_delivery_time)
        output_stream << { date: timestamp, average_delivery_time: average_delivery_time }
      end

      def filter_valid_durations(window)
        input_stream.filter { |e| window.include?(e[:timestamp]) }.pluck(:duration)
      end
    end
  end
end
