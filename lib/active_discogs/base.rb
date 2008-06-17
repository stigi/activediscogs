module ActiveDiscogs
  class Base < ActiveResource::Base
    self.site = "http://www.discogs.com"

    def self.api_key=(key)
      @@key = key
    end
    def self.api_key
      @@key
    end
    
    def self.element_path(id, prefix_options = {}, query_options = nil)
      query_options[:f] = "xml"
      query_options[:api_key] = @@key
      prefix_options, query_options = split_options(prefix_options) if query_options.nil?
      "/#{element_name}/#{id}#{query_string(query_options)}"
    end
  end
end