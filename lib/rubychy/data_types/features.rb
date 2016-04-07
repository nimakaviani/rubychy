module Rubychy
  module DataTypes
    class Features < Rubychy::DataTypes::Base
      attribute :manuallySendReadReceipts, Boolean, :default => false
      attribute :receiveReadReceipts, Boolean, :default => false
      attribute :receiveDeliveryReceipts, Boolean, :default => false
      attribute :receiveIsTyping, Boolean, :default => false
    end
  end
end

