module Policies
  module Bidding
    class ManagePolicy
      attr_accessor :bidding, :provider

      def initialize(bidding, provider)
        @bidding = bidding
        @provider = provider
      end

      def self.allowed?(bidding, provider)
        new(bidding, provider).allowed?
      end

      def allowed?
        ::Bidding.by_provider(provider).find_by(bidding).any?
      end
    end
  end
end
