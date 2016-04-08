module Rubychy
  module DataTypes
    class ReadReceipt < Rubychy::DataTypes::SentMessage
      attribute :msgIds, Array[String]

      def initialize *params
        super(*params)
        @type = 'read-receipt'
      end

      def validations
        {
          msgIds: { required: true, class: [Array] },
          to: { required: true, class: [String] },
          type: { required: true, class: [String] },
          chatId: { required: true, class: [String] },
        }
      end
    end
  end
end


