module Rubychy
  module DataTypes
    class Keyboard < Rubychy::DataTypes::Base
      attribute :type, String, :default => "suggested"
      attribute :to, String
      attribute :hidden, Boolean, :default => "false"
      attribute :responses, Array[KeyboardResponse]

      def validations
        {
          type: { required: true, class: [String] },
          to: { required: true, class: [String] },
          hidden: {required: false, class: [Boolean] },
          responses: {required: true, class: [Array] }
        }
      end
    end
  end
end



