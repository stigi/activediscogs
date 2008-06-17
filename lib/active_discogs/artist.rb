module ActiveDiscogs
  class Artist < ActiveDiscogs::Base
    self.format = ActiveDiscogs::XmlGzipFormat.new("artist")
  end
end