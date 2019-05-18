# frozen_string_literal: true

require 'thor'

module Unbabel
  module CLI
    class Application < Thor
      desc 'average [SOURCE_FILE]', 'Calculate moving average of SOURCE_FILE'
      option :window_size, type: :numeric, default: 10
      def average(source_file)
        # TODO
      end
    end
  end
end
