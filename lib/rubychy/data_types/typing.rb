module Rubychy
  module DataTypes
    class Typing < Rubychy::DataTypes::SentMessage
      attribute :isTyping, Boolean, :default => false

      def initialize *params
        super(*params)
        @type = 'is-typing'
      end

      def validations
        {
          isTyping: { required: true, class: [Boolean] },
          to: { required: true, class: [String] },
          type: { required: true, class: [String] },
          chatId: { required: true, class: [String] },
        }
      end
    end
  end
end


