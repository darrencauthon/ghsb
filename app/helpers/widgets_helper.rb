module WidgetsHelper

  def source_display_name
    'Github StatusBoard'
  end

  def widget_link
    "panicboard://?url=#{ u request.url }.widget&panel=#{ u @panel_type }&sourceDisplayName=#{ u source_display_name }"
  end

end
