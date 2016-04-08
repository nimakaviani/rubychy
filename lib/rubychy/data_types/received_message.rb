module Rubychy
  module DataTypes
    class ReceivedMessage < Rubychy::DataTypes::Message
      attribute :from, String
      attribute :timestamp, Integer
      attribute :readReceiptRequested, Boolean
      attribute :participants, Array[String]
      attribute :mention, String

      attribute :body, String

      attribute :attribution, Attribution
      attribute :noForward, Boolean
      attribute :readReceiptRequested, Boolean

      attribute :picUrl, String

      attribute :videoUrl, String

      attribute :data, String

      attribute :stickerPackId, String
      attribute :stickerUrl, String

      attribute :isTyping, Boolean
    end
  end
end

