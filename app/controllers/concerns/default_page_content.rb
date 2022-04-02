module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Blog and Portfolio Website"
    @seo_keywords = "Mateusz Talkowski portfolio"
  end
end