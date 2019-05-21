# frozen_string_literal: true

require 'active_support/all'

require 'unbabel/cli/version'
require 'unbabel/cli/application'
require 'unbabel/cli/input_stream'
require 'unbabel/cli/output_stream'
require 'unbabel/cli/reporter'
require 'unbabel/cli/moving_average_calculator'

module Unbabel
  module CLI
    class Error < StandardError; end
  end
end
