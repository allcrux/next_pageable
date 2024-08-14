require "active_support/core_ext/module/delegation"

module NextPageable
  class Page
    include Enumerable

    attr_reader :collection
    attr_reader :next_page_index

    def initialize(collection:, next_page_index:)
      @collection = collection
      @next_page_index = next_page_index
    end

    delegate :each, to: :collection
    delegate :to_ary, to: :collection
    delegate :to_a, to: :collection
    delegate :size, to: :collection
    delegate :length, to: :collection

    def next_page?
      next_page_index.present?
    end
  end
end
