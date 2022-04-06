module CopyrightSource
  extend ActiveSupport::Concern
  class Renderer
    def self.copyright name, msg
      "<center><b>#{name}</b><br>#{msg}<br>#{Time.now.year}</center>".html_safe
    end
  end
end