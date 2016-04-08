module Rubychy
  module DataTypes
    class Video < Rubychy::DataTypes::SentMessage
      attribute :videoUrl, String
      attribute :loop, Boolean, :default => false
      attribute :muted, Boolean, :default => false
      attribute :autoplay, Boolean, :default => false
      attribute :noSave, Boolean, :default => false
      attribute :typeTime, Integer, :default => 0

      def initialize *params
        super(*params)
        @type = 'video'
      end

      def validations
        {
          videoUrl: { required: true, class: [String] },
          to: { required: true, class: [String] },
          type: { required: true, class: [String] },
          chatId: { required: true, class: [String] },
        }
      end
    end
  end
end


