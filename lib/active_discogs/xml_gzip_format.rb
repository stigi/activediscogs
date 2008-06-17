require'zlib'

module ActiveDiscogs
  class XmlGzipFormat
    
    def initialize root
      @root = root
    end
    
    def extension
      "xml"
    end
    
    def mime_type
      "application/xml"
    end
    
    def encode(hash)
      hash.to_xml
    end
    
    def decode(xml)
      begin 
        gz = Zlib::GzipReader.new(StringIO.new(xml))
        xml = gz.read
      ensure
        gz.close
      end
      from_xml_data(Hash.from_xml(xml))
    end
    
    private
      # Manipulate from_xml Hash, because xml_simple is not exactly what we
      # want for Active Resource.
      def from_xml_data(data)
        if data.is_a?(Hash) && data.keys.size == 1
          data.values.first[@root]
        else
          data[@root]
        end
      end
      
      def logger
        ActiveResource::Base.logger
      end 
  end
end