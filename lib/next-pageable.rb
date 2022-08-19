# frozen_string_literal: true

require "active_support/concern"

require_relative "next-pageable/version"
require_relative "next-pageable/page"

module NextPageable
  extend ActiveSupport::Concern

  class_methods do
    def paginate(page, pagesize: 15)
      page = page ? page.to_i : 1
      collection =
        limit(pagesize + 1)
          .offset((page - 1) * pagesize)

      if collection.length > pagesize
        next_page_index = page + 1
        collection = collection[0...-1]
      end

      Page.new(collection: collection, next_page_index: next_page_index)
    end
  end
end
