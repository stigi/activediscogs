module ActiveDiscogs
  class Release < ActiveDiscogs::Base
    self.format = ActiveDiscogs::XmlGzipFormat.new("release")
  end
end