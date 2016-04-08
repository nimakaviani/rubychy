require 'httpclient'
require 'virtus'
require 'multi_json'

require 'rubychy/version'
require 'rubychy/data_types/base'
require 'rubychy/data_types/attribution'
require 'rubychy/data_types/user'

require 'rubychy/data_types/keyboard_response'
require 'rubychy/data_types/keyboard'
require 'rubychy/data_types/keyboards'

require 'rubychy/data_types/message'
require 'rubychy/data_types/sent_message'
require 'rubychy/data_types/received_message'
require 'rubychy/data_types/received_messages'

require 'rubychy/data_types/link'
require 'rubychy/data_types/text'
require 'rubychy/data_types/picture'
require 'rubychy/data_types/video'
require 'rubychy/data_types/typing'
require 'rubychy/data_types/read_receipt'

require 'rubychy/bot'
require 'rubychy/api_response'

module Rubychy
  module Errors
    # Error returned when a required param is missing
    class MissingParamsError < StandardError
      def initialize(parameter, action)
        super("Missing parameter `#{parameter}` for `#{action}`")
      end
    end

    # Error returned when a param type is invalid
    class InvalidParamTypeError < StandardError
      def initialize(parameter, current_type, allowed_types)
        super("Invalid parameter type: `#{parameter}`: `#{current_type}`. Allowed types: #{allowed_types.each { |type| type.class.to_s }.join(',')}.")
      end
    end

    # Error returned when something goes bad with your request to the Rubychy API
    class BadRequestError < StandardError
      def initialize(error_code, message)
        super("Bad request. Error code: `#{error_code}` - Message: `#{message}`")
      end
    end

    # Error returned when Rubychy API Service is unavailable
    class ServiceUnavailableError < StandardError
      def initialize(status_code)
        super("Rubychy API Service unavailable (HTTP error code #{status_code})")
      end
    end

    # Error returned when HTTPClient raise a timeout (?)
    class TimeoutError < StandardError
      def initialize(message)
        super("Timeout reached. Message: #{message}")
      end
    end
  end
end
