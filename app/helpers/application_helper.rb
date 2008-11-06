# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


  def title(str)
    content_for :title do 
      str
    end
    "<h1>#{str}</h1>"
  end
  
  def navigation(str)
    content_for :navigation do
      str
    end
  end
  
  def page_block(&block)
    concat("<div class='page_block'>", block.binding)
    yield
    concat("</div>", block.binding)
  end

  def toggle_div_tag( label, tag_id )
    "<a href=# onclick=\"Element.toggle('#{tag_id}');\">#{label}</a>"
  end
end
