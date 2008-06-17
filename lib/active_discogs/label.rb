module ActiveDiscogs
  class Label < ActiveDiscogs::Base
    self.format = ActiveDiscogs::XmlGzipFormat.new("label")
  end
end