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
  
  def link_to_remote_with_effects(label,target,url,method=:get,spinner="page_spinner")
  	link_to_remote( label, 
  	        :url => url, :method => method,
  	        :update => target,
						:before => "Element.hide('#{target}');" + 
						           visual_effect(:appear, spinner,:duration => 0.25),
            :complete =>  visual_effect(:fade,spinner) + 
                          visual_effect(:appear, target) )
  end
  
  def page_spinner
    "<div id='page_spinner' class='top_right_spinner' style='display: none; float: right;'>
      #{image_tag 'spinner.gif', :height => 16, :align => 'baseline'} Loading ...</div>"
  end
  
end
