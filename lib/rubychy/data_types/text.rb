module Rubychy
  module DataTypes
    class Text < Rubychy::DataTypes::SentMessage
      attribute :body, String
      attribute :typeTime, Integer, :default => 0

      def initialize *params
        super(*params)
        @type = 'text'
      end

      def validations
        {
          body: { required: true, class: [String] },
          to: { required: true, class: [String] },
          type: { required: true, class: [String] },
          chatId: { required: true, class: [String] },
          keyboards: { required: false, class: [Array] },
        }
      end
    end
  end
end

