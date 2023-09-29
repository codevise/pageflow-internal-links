require 'pageflow/internal_links/engine'
require 'pageflow/internal_links/version'

module Pageflow
  module InternalLinks
    def self.plugin
      InternalLinks::Plugin.new
    end

    def self.grid_page_type
      InternalLinks::GridPageType.new
    end

    def self.list_page_type
      InternalLinks::ListPageType.new
    end
  end
end
