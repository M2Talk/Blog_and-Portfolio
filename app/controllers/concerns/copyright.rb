require "active_support/concern"
module Copyright
  extend ActiveSupport::Concern
  

  included do
    before_action :set_copyright
  end

  def set_copyright
    @copyright = CopyrightSource::Renderer.copyright "Mateusz Talkowski", "Wszelkie Prawa Zastrzeżone"
  end

end